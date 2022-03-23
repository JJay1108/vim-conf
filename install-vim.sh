#!/bin/bash
cd /home/jayyip/Downloads

cd vim

./configure --with-features=huge \
	--enable-multibyte	\
	--with-ruby-command=/usr/bin/ruby \
	--enable-pythoninterp=dynamic \
	--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	--enable-python3interp=dynamic \
	--with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
	--enable-cscope \
	--enable-gui=auto \
	--enable-gtk2-check \
	--enable-fontset \
	--enable-largefile \
	--enable-fail-if-missing \
	--prefix=/usr/local
