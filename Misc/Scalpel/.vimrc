colorscheme torte
syntax on
set nu
set scrolloff=3
set ts=4
set expandtab
set nobackup
set noswapfile
set cindent
set autoindent
set backspace=2
set showmatch
set smartindent
set softtabstop=4
set shiftwidth=4
set hlsearch
hi Search term=standout ctermfg=white ctermbg=darkblue
set cursorline
set cursorcolumn
hi Normal  ctermfg=252 ctermbg=none
set fdm=syntax

map <F4> :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
