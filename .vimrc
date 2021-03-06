call plug#begin()
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
"Plug 'preservim/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
"Plug 'enricobacis/vim-airline-clock'
"Plug 'altercation/vim-colors-solarized'
"Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'
Plug 'Yggdroot/indentLine'
"Plug 'skywind3000/asyncrun.vim'
Plug 'ajmwagar/vim-deus'
"Plug 'lambdalisue/nerdfont.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'bagrat/vim-buffet'
Plug 'yianwillis/vimcdoc'
"Plug 'vim-scripts/a.vim'
"Plug 'Yohannfra/Vim-Goto-Header'
"Plug 'rhysd/vim-clang-format'
Plug 'mhinz/vim-signify'
call plug#end()


"echo nerdfont#find()



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
let g:gutentags_ctags_extra_args = ['--fields=+niazIS', '--extra=+fq']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxUZ']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif


"---------------------------------------------
"					gutentags end
"---------------------------------------------

set splitbelow splitright
"为了跳转tag的时候方便些ctrl + w + ]

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
let g:Lf_PreviewInPopup = 1
nnoremap <Leader>fl :Leaderf line --bottom<CR>
nnoremap <Leader>ff :Leaderf file --bottom<CR>
nnoremap <Leader>tg :Leaderf tag --bottom<CR>
nnoremap <Leader>tt :Leaderf bufTag --right<CR>
nnoremap <Leader>rg :Leaderf rg --bottom<CR>
nnoremap <Leader>bf :Leaderf buffer --popup<CR>
nnoremap <Leader>fun :Leaderf function<CR>
nnoremap <Leader>mr :Leaderf mru --bottom<CR>
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 , 'Colorscheme': 1}
"let g:Lf_CommandMap = {'<C-k>': ['<Up>'], '<C-j>': ['<Down>']}
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
"---------------------------------------------
"					LeaderF end
"--------------------------------------------
"let mapleader=","

"--------------------------------
"				配置背景
"--------------------------------


"	set background=light

"	"else
"	set background=dark
"endif

"set t_Co=256

"if has("termguicolors")
	set termguicolors
"endif


"---------------配置结束----------

"---------------ALE	BEGIN---------

"let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0 
let g:ale_disable_lsp = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
	\ 'cpp': ['cppcheck'],
	\ }

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
"colorscheme slate
colorscheme deus

"---------------AIRLINE BEGIN---------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_deus_bg='dark'
let g:alrline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

"---------------AIRLINE END-----------

"---------------VIM BUFFET------------
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=white ctermfg=100 guibg=#F0F8FF guifg=#000000
  hi! BuffetBuffer cterm=NONE ctermbg=grey ctermfg=black
endfunction




"---------------VIM BUFFET END ------



"---------------VIMSPECTOR begin------
"
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
"
"---------------QUICK COMPILE---------
nnoremap <leader>rr :call CompileRunGcc()<CR>

function! CompileRunGcc()
	execute "w"
	if &filetype == 'c'
		if !isdirectory('build')
			execute "!mkdir build"
		endif	
		execute "!gcc -g % -o build/%<"
		execute "term ./build/%<"
	endif	

	if &filetype == "cpp" 
		if !isdirectory('build')
			execute "!mkdir build"
		endif	
		execute "!g++ -std=c++11 -g % -Wall -o build/%<"
		execute "term ./build/%<"
	endif
endfunction	

"---------------QUICK COMPILE END-----

"---------------QUICK FORMAT----------

nnoremap <leader>fm :call QuickFormat()<CR>

function! QuickFormat()
    execute "w"
    if &filetype == 'c'
        execute "!clang-format -i % -style=file"
    endif

endfunction

"------------------------------------

if exists('$TMUX')
	set term=screen-256color
endif

"inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"nnoremap <leader>li A
"nnoremap <leader>hi I

"---------------COC NVIM SETTINGS-----
"let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-explorer']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" "输入回车来选择补全项"

" Use K to show documentation in preview window.
nnoremap <silent> <leader>doc  :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>cf :CocConfig<CR>
nnoremap <C-n> :CocCommand explorer<CR>
"---------------COC NVIM END---------
"quickly edit the .vimrc

"---------------clang FORMAT----------
"let g:clang_format#code_style = "llvm"
"let g:clang_format#auto_format_on_insert_leave = 1
"let g:clang_format#style_options = {
"            \ "AccessModifierOffset": -2,
"            \ "BreakBeforeBraces": "Allman"}

"---------------clang FORMAT END------


"--------------VIM SIGNIFY BEGIN------
let g:signify_sign_add = ''
let g:signify_sign_change = ''
"--------------VIM SIGNIFY END--------


nnoremap <silent> <leader>ee :e ~/.vim/.vimrc<CR>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>sw :split<CR>

nnoremap <leader>jj <C-w><Down>
nnoremap <leader>kk <C-w><Up>
nnoremap <leader>hh <C-w><Left>
nnoremap <leader>ll <C-w><Right>

"to highlight the same word
nnoremap hi gd    

set encoding=UTF-8
"set showtabline=2
"set cmdheight=2
set helplang=cn
set updatetime=500
set nu
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set ruler
set cursorline
set showcmd
set autoindent
set syntax=on
set nocompatible
set backspace=indent,eol,start
set hlsearch
set conceallevel=2
set noshowmode
set synmaxcol=300
"只对前三百字符进行高亮，避免卡顿
