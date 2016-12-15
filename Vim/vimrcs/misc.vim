syntax enable
set nocompatible
set cuc cul
set hlsearch incsearch
set autoread autowrite
set backspace=indent,eol,start
set ai si cin ci sts=2 sw=2 ts=2 et nu nobk noswf
set background=dark
let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized
set t_Co=256
set completeopt=preview,menu
set matchtime=0
set shm=atI
set ff=unix
set wildmenu
set shortmess+=atI   
set guifont=Monaco\ 10
set report=0
set scrolloff=5
set history=1000
set cmdheight=1
set noeb
set novb
set wig+=*.DS_Store
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}   

autocmd BufNewFile *.cc,*.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.hs exec ":call SetTitle()" 
autocmd BufNewFile * exec ":normal G"

"cursor go back to the last edited position of the previous session
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=240 ctermfg=NONE
set noeb
set novb
