func! SetTitle() 
  if &filetype == 'sh' 
    call setline(1,"#!/bin/bash") 
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
  elseif &filetype == 'haskell'
    call setline(1,"#!/usr/bin/env runhaskell")
  else 
    call setline(1,          "/*************************************************************************") 
    call append(line("."),   "  >         File: ".expand("%")) 
    call append(line(".")+1, "  >       Author: Yuan Lei") 
    call append(line(".")+2, "  >         Mail: yuanlei@indeed.com") 
    call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
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
endfunc 

func! CompileHome()
  exec "w"
  if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
    exec '!echo "************************Compiling************************" && echo "[Parameters]: g++ -std=c++14 -g -O2 -Wall -DHOME % -o %<" && g++ -std=c++14 -g -O2 -Wall -DHOME % -o %<'
    call Run()
  elseif &filetype == 'java' 
    exec "!javac %" 
  elseif &filetype == 'sh'
    exec "!bash %"
  elseif &filetype == 'python'
    exec "!python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    exec "!go run %"
  elseif &filetype == 'mkd'
    exec "!~/.vim/markdown.pl % > %.html &"
    exec "!firefox %.html &"
  endif
endfunc

func! Run()
  if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
    exec '!echo "*************************Running*************************" && ./%<'
  elseif &filetype == 'java' 
    exec "!java %<" 
  elseif &filetype == 'sh'
    exec "!bash %"
  elseif &filetype == 'python'
    exec "!python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    exec "!go run %"
  elseif &filetype == 'mkd'
    exec "!~/.vim/markdown.pl % > %.html &"
    exec "!firefox %.html &"
  endif
endfunc

func! Compile()
  exec "w"
  if &filetype == 'c' || &filetype == 'cc' || &filetype == 'cpp'
    exec '!echo "************************Compiling************************" && echo "[Parameters]: g++ -std=c++14 -g -O2 -Wall % -o %<" && g++ -std=c++14 -g -O2 -Wall % -o %< &'
    call Run()
  elseif &filetype == 'java' 
    exec "!javac %" 
  elseif &filetype == 'sh'
    exec "!bash %"
  elseif &filetype == 'python'
    exec "!python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    exec "!go run %"
  elseif &filetype == 'mkd'
    exec "!~/.vim/markdown.pl % > %.html &"
    exec "!firefox %.html &"
  endif
endfunc

func! Rungdb()
  exec "w"
  exec "!g++ -std=c++14 -g -Wall -DHOME % -o %<"
  exec "!gdb ./%<"
endfunc

func! FormartSrc()
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

