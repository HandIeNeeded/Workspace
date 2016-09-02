map <F2> <ESC>ggVG"+y
map <F3> :call Compile()<cr>
map <F4> :call Run()<cr>
map <F5> :call CompileHome()<cr>
map <F6> :call FormartSrc()<cr>
map <F7> :g/^\s*$/d<cr> 
map <F8> :40vs %<.in <cr>
map <F9> :call Rungdb()<cr>

imap [[ {<cr>}<c-o>O

