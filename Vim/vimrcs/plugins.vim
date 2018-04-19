"Vundle
filetype plugin indent on 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

"Yuan Lei
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'shaneharper/vim-rtags'

call vundle#end() 

"Snippets
let g:UltiSnipsEditSplit="vertical"

"NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\~$']
autocmd vimenter * if argc() | NERDTree | wincmd p | else | NERDTree | endif

"YCM
let g:ycm_warning_symbol=">"
let g:ycm_error_symbol=">>"
let g:ycm_key_list_select_completion=['c-n', '<ENTER>']
let g:ycm_key_list_previous_completion=['c-p']
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_global_ycm_extra_conf='~/ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_mb=2048
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_filetype_blacklist={
    \}
let g:ycm_filetype_specific_completion_to_disable={
    \}

"Eclim
let g:EclimCompletionMethod = 'omnifunc'
