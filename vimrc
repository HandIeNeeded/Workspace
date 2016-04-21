"for personal dict and complete

set complete+=k{/usr/include/share/dict/vim/code.dict}
set complete+=i

imap [[ {<cr>}<c-o>O
syntax on
color ron
set ai si cin ci sts=4 sw=4 ts=4 et nu
set matchtime=0
set shm=atI
set wildmenu
set cuc 
set cul 
set shortmess+=atI   
set guifont=Monaco\ 10   
set showcmd         
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}   
set laststatus=2    
"set foldenable      
"set foldmethod=syntax
set nocompatible  
set autoread
set clipboard+=unnamed 
set autowrite
set confirm
set nobackup
set noswapfile
"set ignorecase
set report=0
set scrolloff=15
"set mouse=a
set history=1000
set hlsearch
set incsearch
set cmdheight=1
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
map <C-w> <C-w>w
map <F2> <ESC>ggVG"+y
map <F3> :call Compile()<cr>
map <F4> :!./%< <cr>
map <F5> :call CompileHome()<cr>
map <F6> :call FormartSrc()<cr><cr>
map <F7> :g/^\s*$/d<cr> 
map <F8> :40vs %<.in <cr>
map <F9> :call Rungdb()<cr>
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
		call append(line(".")+4, "*************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H_")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H_")
		call append(line(".")+8, "#endif /* ".toupper(expand("%:r"))."_H_ */")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
endfunc 
func! CompileHome()
	exec "w"
	if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
		exec "!g++ -std=c++11 -g -Wall -DHOME % -o %<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!tie java %<"
	elseif &filetype == 'sh'
		:!tie bash %
	elseif &filetype == 'python'
		exec "!tie python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!tie go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
func! Compile()
	exec "w"
	if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
		exec "!g++ -std=c++11 -g -Wall % -o %<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!tie java %<"
	elseif &filetype == 'sh'
		:!tie bash %
	elseif &filetype == 'python'
		exec "!tie python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!tie go run %"
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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"For yuzhou627
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Rip-Rip/clang_complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set completeopt=preview,menu
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"YCM
let g:ycm_warning_symbol="*"
let g:ycm_error_symbol="✗"
let g:ycm_key_list_select_completion=['<TAB>', 'j', '<Enter>']
let g:ycm_key_list_previous_completion=['k']
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/Retired/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb=1000
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_filetype_blacklist={
"    \ 'cpp': 1,
"    \ 'cxx': 1,
"    \ 'c': 1,
"    \ 'h': 1,
"    \ 'cc': 1
"    \}
"let g:ycm_filetype_specific_completion_to_disable={
"    \ 'gitcommit': 1,
"    \ 'cpp': 1,
"    \ 'cc': 1,
"    \ 'c': 1,
"    \ 'cxx': 1,
"    \ 'h': 1
"    \}

"clang_complete
"let g:clang_library_path='~/vim/bundle/YouCompleteMe/third_party/ycmd/libclang.so.3.7'
"let g:clang_use_library=1
"let g:clang_auto_select=1
"let g:clang_complete_copen=1
