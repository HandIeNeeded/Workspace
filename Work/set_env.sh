#!/bin/bash

cd ~

echo "Now check if Workspace is cloned!!!"

if [ -d "~/Workspace" ]; then
    echo "Cool, Workspace is already there!!!"
else 
    echo "No Workspace found, clone it from github!!!"
    git clone https://github.com/HandIeNeeded/Workspace.git
fi

echo "Now update git repo first!!!"
cd ~/Workspace/
git pull origin master
cd ~

echo "Now Install Oh My Zsh!!!"

if [ -d "~/.oh-my-zsh" ]; then
    echo "Cool, Oh My Zsh is already there!!!"
else
    echo "No Oh My Zsh found, clone it from github!!!"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Now Install Vundle !!!"
if [ -d "~/.vim/bundle" ]; then
    echo "Cool, Vundle is already there!!!"
else
    echo "No Vundle found, clone it from github!!!"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Now set up environment!!!"
cd ~/Workspace/Work
mv ~/.bashrc ~/.bashrc.bak
cp bashrc_work ~/.bashrc
mv ~/.zshrc ~/.zshrc.bak
cp zshrc_work ~/.zshrc

cp ylei.zsh-theme_work ~/.oh-my-zsh/themes/ylei.zsh-theme

mv ~/.vimrc ~/.vimrc.bak
cp vimrc_work ~/.vimrc
cp ycm_extra_conf.py ~/
mv ~/.tmux.conf ~/.tmux.conf
cp ../Misc/tmux ~/.tmux.conf
cp -r ~/Workspace/Misc/Scalpel ~/

source ~/.bashrc
source ~/.zshrc

cd ~
touch .vimrc
echo "source ~/Workspace/Vim/rc.vim" > .vimrc

echo "Basic environment is ready. Install YCM by Vundle if you want!!!"
echo "Done!!! Enjoy :)"



