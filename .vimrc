imap [[ {<CR>}<c-o>O
syntax on
set ai si cin ci sts=-1 sw=4 ts=4 et nu
set matchtime=0
set wildmenu
set cuc 
set cul 
set shortmess=atI   
set guifont=Monaco\ 10   
set showcmd         
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}   
set laststatus=2    
set foldenable      
set foldmethod=syntax
set nocompatible  
set autoread
set clipboard+=unnamed 
set autowrite
set confirm
set nobackup
set noswapfile
set ignorecase
set report=0
set scrolloff=15
set mouse=a
set history=1000
set hlsearch
set incsearch
set cmdheight=1
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
map <C-w> <C-w>w
map <F2> <ESC>ggVG"+y
map <F3> :call ComileHome()<CR>
map <F4> :!time ./%< <CR> 
map <F5> :call Compile()<CR>
map <F6> :call FormartSrc()<CR><CR>
map <F7> :g/^\s*$/d<CR> 
map <F8> :40vs %<.in <CR>
map <F9> :call Rungdb()<CR>
filetype indent on
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
autocmd BufNewFile *.cc,*.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")
    elseif &filetype == 'mkd'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1,"/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: yuzhou627") 
		call append(line(".")+2, "	> Mail:   yuzhou627@gmail.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
    if (expand("%:e") == 'cpp' || expand("%:e") == 'cc')
        if getcwd() == "CF608"
            call append(line(".")+6, "#include<bits/stdc++.h>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
            call append(line(".")+9, getcwd())
        endif
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
func! ComileHome()
	exec "w"
	if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
		exec "!g++ -std=c++11 -g -Wall -DHOME % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
func! Compile()
	exec "w"
	if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
		exec "!g++ -std=c++11 -g -Wall % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
func! Rungdb()
	exec "w"
	exec "!g++ -std=c++11 -g -Wall -DHOME % -o %<"
	exec "!gdb ./%<"
endfunc
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
