# Simple VIM Setting
## Install
```
cd ~
mkdir .vim
cd .vim
git clone https://github.com/rarezhang/simple_vim_setting.git
cd ~
ln -s ~/.vim/.vimrc
```

## VIM Tips 
###1. Under normal mode
```
:wq    - save and quit
i        - insert
x VIM- delete character
dd    - delete line, copied in clipboard 
p     - paste
y     - copy
:help <command>     - look up help doc
:?<pattern>       - search backward
:Explore- file explore
```

###2. Code folding
inside a method and type ```‘za’``` to open and close a fold.

###3. Window splits
```
:e <filename>      - edit another file
:split <filename>   - Horizontal Split
:vsplit <filename>     - vertical split
```

###4. Git
```
:Gwrite    - git add
:Gread    - git checkout
:Gremove    - git rm
:Gmove       - git mv
:Gcommit    - git commit
```

###5. Open undotree  /   NERDTree   /   taglist 
```
<,undo>
<,tree>
<,tag>
```

###6. Snipmate
```
any reserved words + <tab>
e.g., def<tab>
```

###7. Copy and paste
- copy: <shift> + highlight the text + left mouse button
- paste: <shift> + right mouse button

###8. Search and replace the selected text
```
<,r>
```

###9. Go to the next / previous search result
```
<,n>
<,p>
```

###10. Run script
```
<F5>
```

## Install from scratch
###1. remove vim & re-install vim
```
sudo apt-get remove vim
sudo apt-get remove vim-runtime
sudo apt-get remove gvim
sudo apt-get remove vim-tiny
sudo apt-get remove vim-common
sudo apt-get remove vim-gui-common

sudo apt-get install vim
sudo apt-get install vim-doc vim-scripts
```

###2. create vimrc file
```
cd ~
vi .vimrc
```
Copy and paste all the [content](/.vimrc) to .vimrc file.



###3. install pathogen.vim
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

###4. git and install plug-in
```
cd ~/.vim/                                                                                         git init
```
####4.1 supertab
use <Tab> for all your insert completion needs
```
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
```
####4.2 Syntastic
runs files through external syntax checkers and displays any resulting errors to the user
```
git submodule add https://github.com/scrooloose/syntastic.git bundle/syntastic
```
####4.3 Auto Pairs
Insert or delete brackets, parens, quotes in pair.
```
git submodule add https://github.com/jiangmiao/auto-pairs.git bundle/auto-pairs
```
####4.4 Snipmate
provide support for textual snippets
```
git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
```
####4.5 NERDTree
explore your file system and to open files and directories
```
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
```
####4.6 MiniBufferExplorer
list all open buffers as tabs
```
git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
```
####4.7 undotree
store the undo history
```
git submodule add https://github.com/mbbill/undotree.git bundle/undotree
```
####4.8 Tag List
an overview of the structure of source code files: class, filed, method
```
git submodule add https://github.com/vim-scripts/taglist.vim.git bundle/taglist
```
####4.9 vim-airline
a statusline plugin for vim, and provides statuslines and prompts for several other applications
```
git submodule add https://github.com/bling/vim-airline.git bundle/vim-airline
```
####4.10 vim-colors-solarized
colorscheme versions for Vim
```
git submodule add https://github.com/altercation/vim-colors-solarized.git bundle/vim-colors-solarized
```
####4.11 vim-fugitive
Integration with Git
```
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
```
####4.12. update all
```
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
```

###5. move .vimrc to the directory .vim; create symbolic link to .vimrc
```
cd ~
mv .vimrc .vim
ln -s ~/.vim/.vimrc
```

