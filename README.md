# Simple VIM Setting
## Screenshot
![simplevimseetingscreenshot](https://cloud.githubusercontent.com/assets/5633774/8563546/f99f3706-24f5-11e5-9451-5e33d7cc2652.png)

## Features
- Pathogen: easy to install plugins and runtime files
- Supertab: <tab> for all your insert completion needs
- Syntastic: external syntax checkers and displays any resulting errors
- Auto Pairs: insert or delete brackets, parens, quotes in pair
- Snipmate: provide support for textual snippets
- NERDTree: explore your file system and to open files and directories
- MiniBufferExplorer: list all open buffers as tabs
- Undotree: store the undo history
- Tag List: an overview of the structure of source code files: class, filed, method
- Vim-airline: provides statuslines and prompts
- Vim-colors-solarized: colorscheme versions for Vim
- Vim-fugitive: Integration with Git
- Code folding
- Show ALL white spaces as dot
- Return to last edit position when opening files
- Automatically insert file header when creating new files [*.cpp,*.[ch],*.sh,*.rb,*.java,*.py]
- Compile and execute


## Install
```
wget -qO- https://raw.githubusercontent.com/rarezhang/simple_vim_setting/master/install.sh | sh -x
```
## Uninstall
```
rm -rf ~/.vim ~/.vimrc
```

## VIM Tips
###1. Under normal mode
```
:wq             - save and quit
i               - insert
x VIM           - delete character
dd              - delete line, copied in clipboard
p               - paste
y               - copy
:help <command> - look up help doc
:?<pattern>     - search backward
:Explore        - file explore
```

###2. Code folding
inside a method and type ```‘za’``` to open and close a fold.

###3. Window splits
```
:e <filename>      - edit another file
:split <filename>  - Horizontal Split
:vsplit <filename> - vertical split
```

###4. Git
```
:Gwrite  - git add
:Gread   - git checkout
:Gremove - git rm
:Gmove   - git mv
:Gcommit - git commit
```

###5. Open undotree  /   NERDTree   /   taglist /  indent line
```
<,undo>
<,tree>
<,tag>
<,line>
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

###10. Execute script
```
<F5>
```

###11. Auto completion
```<C-Space>``` - Completion
```<leader>g``` - Goto assignments (typical goto function) 
```<leader>d``` - Goto definitions (follow identifier as far as possible, includes imports and statements) 
```K```- Show Documentation/Pydoc (shows a popup with assignments) 
```<leader>rname``` - Renaming
```<leader>n``` - Usages (shows all the usages of a name)
```:Pyimport <module name>``` - Open module, e.g. opens the `os` module :Pyimport os
B

## Install from scratch
###1. Remove vim & re-install vim
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

###2. Create vimrc file
```
mkdir ~/.vim && cd .vim
vi vimrc
```
Copy and paste all the [content](/vimrc) to .vimrc file.



###3. Install pathogen.vim
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

###4. Git and install plug-in
```
cd ~/.vim/
git init
```
####4.1 Supertab
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
####4.7 Undotree
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
####4.10 Vim-colors-solarized
colorscheme versions for Vim
```
git submodule add https://github.com/altercation/vim-colors-solarized.git bundle/vim-colors-solarized
```
####4.11 Vim-fugitive
Integration with Git
```
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
```
####4.12 Jedi-vim
Python autocompletion
```
git submodule add https://github.com/davidhalter/jedi-vim.git bundle/jedi-vim
```
####4.13 IndentLine
displaying thin vertical lines at each indentation level
```
git submodule add https://github.com/Yggdroot/indentLine.git bundle/indentLine
```
####4.14 Update all
```
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
```

###5. move .vimrc to the directory .vim; create symbolic link to .vimrc
```
cd ~
ln -s ~/.vim/vimrc ~/.vimrc
```

###6 turn off the binding of ctrl-s and gets rid of any XOFF on scrren messages
```
cd ~
touch .bash_profile
vi .bash_profile
```
copy and paste below content to .bash_profile
```
#turn off the binding of ctrl-s and gets rid of any XOFF on scrren messages when pressng ctrl-s
bind -r '\C-s'
stty -ixon
```
