sudo add-apt-repository ppa:git-core/ppa
sudo add-apt repository ppa:noobslab/theme
sudo apt-get update
sudo apt-get install git delorean-dark-3.16 awesome awesome-extra vim-gnome git ctags rxvt-unicode-256color gmrun libgnome-keyring-dev gnome-media
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
ln -s $DIR/widgets.luasudo apt-get install libgnome-keyring-dev


cd /usr/share/doc/git/contrib/credential/gnome-keyring
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring


