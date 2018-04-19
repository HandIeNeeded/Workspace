cd ~
git clone https://github.com/vim/vim.git Vim

#fix ycm build core error: python config header file not found
sudo apt-get install python-dev

./configure --enable-pythoninterp=yes
make
make install

cp ~/Workspace/Misc/ycm_extra_conf.py ~

cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
