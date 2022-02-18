call plug#begin()
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'enricobacis/vim-airline-clock'
Plug 'altercation/vim-colors-solarized'
"Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'
call plug#end()

set tags=./.tags;,.tags


"---------------------------------------------
"					tagbars	begin				
"-------------------------------------------------

nnoremap <F8> :TagbarToggle<CR>

"---------------------------------------------
"					tagbars	end                 
"---------------------------------------------

"---------------------------------------------
"					gutentags begin
"---------------------------------------------


" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']


" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif


"---------------------------------------------
"					gutentags end
"---------------------------------------------


"---------------------------------------------
"					NERDTree begin
"---------------------------------------------

"noremap<C-n> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"---------------------------------------------
"					NERDTree end
"---------------------------------------------

"---------------------------------------------
"					LeaderF begin
"---------------------------------------------

let mapleader=','
nnoremap <Leader>fl :LeaderfLine<CR>
nnoremap <Leader>ff :LeaderfFile<CR>
nnoremap <Leader>tg :LeaderfTag<CR>
nnoremap <Leader>tt :Leaderf bufTag --right<CR>
nnoremap <C-n> :CocCommand explorer<CR>

"let g:Lf_CommandMap = {'<C-k>': ['<Up>'], '<C-j>': ['<Down>']}

"---------------------------------------------
"					LeaderF end
"--------------------------------------------
"let mapleader=","

"--------------------------------
"				配置背景
"--------------------------------
"if has ('gui_running')
"	set background=light
"else
"	set background=dark
"endif

"set t_Co=256

"if has("termguicolors")
"	set termguicolors
"endif


"---------------配置结束----------

"---------------ALE	BEGIN---------

"let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0 
let g:ale_disable_lsp = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"let g:ale_linters = {
"	\ 'c': ['gcc'],
"	\ 'cpp': ['g++'],
"""	\ }

let g:ale_linters_explicit = 1	"只显示运行ale_linters的文件
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -02 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -02 -std=c++17'
"let g:ale_c_cppcheck_options = '--enable=all'
"let g:ale_cpp_cppcheck_options = '--enable=all'
highlight ALEWarning ctermbg=DarkMagenta

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"---------------ALE END-----------

"colorscheme evening 
"colorscheme elflord 
"colorscheme solarized
"colorscheme desert 
"colorscheme peachpuff
colorscheme slate

"---------------AIRLINE BEGIN---------
let g:airline_theme='molokai'
let g:alrline#extensions#tabline#enabled = 1
"---------------AIRLINE END-----------

"---------------VIMSPECTOR begin------
"
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
"
"---------------QUICK COMPILE---------
nnoremap r :call CompileRunGcc()<CR>

function! CompileRunGcc()
	execute "w"
	if &filetype == 'c'
		if !isdirectory('build')
			execute "!mkdir build"
		endif	
		execute "!gcc -g % -o build/%<"
	endif	

	if &filetype == "cpp" 
		if !isdirectory('build')
			execute "!mkdir build"
		endif	
		execute "!g++ -g % -o build/%<"
	endif
endfunction	

"---------------QUICK COMPILE END-----
if exists('$TMUX')
	set term=screen-256color
endif

"inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"nnoremap <leader>li A
"nnoremap <leader>hi I

"quickly edit the .vimrc
nnoremap <silent> <leader>ee :e ~/.vim/.vimrc<CR>

"set showtabline=2
set nu
set tabstop=4
set shiftwidth=4
set ruler
set cursorline
set autoindent
set showcmd
set autoindent
set syntax=on
set nocompatible
set backspace=indent,eol,start
