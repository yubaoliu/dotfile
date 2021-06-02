sudo apt update
sudo apt-get install -y software-properties-common

echo "Install ohmyzsh"
echo "https://ohmyz.sh/#install"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install dependencies"
sudo apt install -y trash-cli \
libevent-dev \
libncurses5-dev \
libncursesw5-dev \
bison \
byacc \
autotools-dev \
automake \
zsh \
vim-gtk  #vim clipboard

echo "Install ruby"
sudo apt-add-repository ppa:brightbox/ruby-ng && sudo apt-get -y update
sudo apt install -y ruby ruby-dev

# VIm plugin
sudo apt-get install -y astyle clang-format python-autopep8  remark 
sudo apt install -y npm && npm install -g remark-cli

sudo apt install python3-pip
pip install autopep8
pip install yapf 


#  Un-share the history among terminals
unsetopt share_history
setopt no_share_history

# mkdir
echo -e "function mkcd(){mkdir -p \$1 && cd \$1}" >> ~/.zshrc && exec $SHELL
