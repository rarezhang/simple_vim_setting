#!/bin/bash
echo "install simple_vim_setting"
echo "---------------------------------"
echo "install supporting tools.."
if which apt-get >/dev/null; then
    sudo apt-get install -y vim ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git ctags xclip astylele python-setuptools python-dev git
fi

echo "---------------------------------"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "create .vimrc file"
curl -LSso ~/.vimrc https://raw.githubusercontent.com/rarezhang/simple_vim_setting/master/vimrc

echo "install vim plugins.."
cd ~/.vim/
git init
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/scrooloose/syntastic.git bundle/syntastic
git submodule add https://github.com/jiangmiao/auto-pairs.git bundle/auto-pairs
git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
git submodule add https://github.com/mbbill/undotree.git bundle/undotree
git submodule add https://github.com/vim-scripts/taglist.vim.git bundle/taglist
git submodule add https://github.com/bling/vim-airline.git bundle/vim-airline
git submodule add https://github.com/altercation/vim-colors-solarized.git bundle/vim-colors-solarized
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
vim -u NONE -c "helptags vim-fugitive/doc" -c q
git submodule add https://github.com/davidhalter/jedi-vim.git bundle/jedi-vim
git submodule add https://github.com/Yggdroot/indentLine.git bundle/indentLine
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

echo "-----------------------------------------"
echo "done!"
