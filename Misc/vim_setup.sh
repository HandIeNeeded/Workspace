cd ~
git clone https://github.com/vim/vim.git Vim

./configure --enable-pythoninterp=yes
make
make install

cp ~/Workspace/Misc/ycm_extra_conf.py ~

cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
