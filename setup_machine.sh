sudo add-apt-repository ppa:git-core/ppa
sudo add-apt repository ppa:noobslab/theme
sudo apt-get update
sudo apt-get install git delorean-dark-3.12 awesome awesome-extra vim-gnome git ctags rxvt-unicode-256color gmrun
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "taking files from "$DIR

cd
ln -s $DIR/.vim
ln -s $DIR/.vimrc
ln -s $DIR/.Xresources
ln -s $DIR/.gitconfig
ln -s $DIR/.gtkrc-2.0
xrdb .Xresources
cd .config
mkdir awesome
cd awesome
ln -s $DIR/rc.lua
ln -s $DIR/vicious
ln -s $DIR/widget_fun.lua
ln -s $DIR/widgets.lua
