ROOT=`pwd`
cd $HOME
ln -s $ROOT/.vimrc
ln -s $ROOT/.tmux.conf
ln -s $ROOT/.Xresources
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


