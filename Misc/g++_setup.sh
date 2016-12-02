cd 
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-6 g++-6

sudo rm /usr/bin/g++
sudo rm /usr/bin/gcc
sudo ln /usr/bin/g++-6 /usr/bin/g++
sudo ln /usr/bin/gcc-6 /usr/bin/gcc

