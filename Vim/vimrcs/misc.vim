syntax on
set nocompatible  
set cuc cul
set hlsearch incsearch
set autoread autowrite
set ai si cin ci sts=2 sw=2 ts=2 et nu nobk noswf
colorscheme desert
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
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}   

autocmd BufNewFile *.cc,*.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.hs exec ":call SetTitle()" 
autocmd BufNewFile * normal G
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=234 ctermfg=NONE
