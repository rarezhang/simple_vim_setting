# Simple VIM Setting

## VIM Tips 
###1. Under Normal Mode
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

###2. Code Folding
inside a method and type ```‘za’``` to open and close a fold.

###3. Window Splits
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

###5. open undotree  /   NERDTree   /   taglist 
```
,undo
,tree
,tag
```

###6. snipmate
```
<any reserved words> + <tab>
e.g., def<tab>
```

###7. copy and paste
- copy: shift+highlight the text+left mouse button
- paste: shift+right mouse button

###8. search and replace the selected text
```
,r
```

###9.  go to the next / previous search result
```
,n
,p
```

==================================================================================
## Install

==================================================================================
## Install from scratch
###1. remove vim & install vim
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

###2. create .vimrc file
```
cd ~
vi .vimrc
```
```
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set nocompatible
set showcmd
set ruler    " Always show current position
set cul   " highlight current line
set number
set history=2000   " Sets how many lines of history VIM has to remember
set mouse=a
set clipboard+=unnamed  " share clipboard with windows
set autochdir  " auto change windows cwd to file's dir
"set autowrite  " auto save file
set autoread   " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start  " change backspace:same as windows, backspace over everything in insert mode, same as set backspace=2
set whichwrap+=<,>,h,l  " Automatically go to next line
set iskeyword+=_,$,@,%,#,-  " don't change line if has these keyword
set encoding=utf-8  " how vim shall represent characters internally


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map leader & mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","
"" press <leader>r: search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"" go to the next search result do: <leader>n
map <leader>n :cn<cr>
"" go to the previous search results do: <leader>p
map <leader>p :cp<cr>
"" open taglist, show all functions, parameters
map <leader>tag :TlistToggle<CR>
"" open NERDTree, tree of working directory
map <leader>tree :NERDTreeToggle<CR>
"" open undotree, undo and redo
map <leader>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file type
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin indent on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch  " increament search: like search in modern browsers
set hlsearch   " Highlight search results
set ignorecase  " Ignore case when searching
set smartcase   " When searching try to be smart about cases 
set magic       " For regular expressions turn magic on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" space and tab and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4    " 1 tab == 4 spaces
set shiftwidth=4  " 1 tab == 4 spaces
set expandtab   " Use spaces instead of tabs
"" show ALL white spaces as dot
set listchars=trail:·
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
               \ endif
               
               
               
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               " set pathogen
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               execute pathogen#infect()
               
               
               
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               " set NERDTree
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               "" open NERDTree automatically when vim starts up if no files were specified
               autocmd StdinReadPre * let s:std_in=1
               autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
               "" close vim if the only window left open is NERDTree
               autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
               "" open a NERDTree automatically when vim starts up
               "autocmd vimenter * NERDTree
               "" ignore pyc file
               let NERDTreeIgnore=['\.pyc']
               
               
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               " set Syntastic
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               set statusline+=%#warningmsg#
               set statusline+=%{SyntasticStatuslineFlag()}
               set statusline+=%*
               let g:syntastic_always_populate_loc_list = 1
               let g:syntastic_auto_loc_list = 1
               let g:syntastic_check_on_open = 1
               let g:syntastic_check_on_wq = 0
               
               
               
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               " set undotree
               """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               "" Persistent undo
               if has("persistent_undo")
                       set undodir='~/.undodir/'
                           set undofile
                           endif
                           
                           
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           " set taglist
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           "" automatically open the taglist window, when start Vim
                           let Tlist_Auto_Open = 1
                           "" close vim if the only window left open is taglist
                           let Tlist_Exit_OnlyWindow = 1
                           
                           
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           " set airline
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           set t_Co=256
                           set laststatus=2
                           set encoding=utf-8
                           set ttimeoutlen=50
                           
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           " set vim-colors-solarized
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           syntax enable
                           set background=dark
                           let g:solarized_termcolors=256
                           colorscheme solarized
                           
                           
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           " set fugitive
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           set statusline+=%{fugitive#statusline()} "  show Git
                           
                           
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           " mark down file
                           """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                           au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
                               let g:vim_markdown_folding_disabled=1
                                   let g:vim_markdown_no_default_key_mappings=1
                                   
                                   
                                   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                   " create new file: insert file head
                                   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                   autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
                                   ""function SetTitle
                                   func SetTitle()
                                    if &filetype == 'sh'
                                          call setline(1,"\#!/bin/bash")
                                            call append(line("."), "")
                                             elseif &filetype == 'python'
                                               call setline(1,"#!/usr/bin/env python")
                                                 call append(line("."),"# coding=utf-8")
                                                   call append(line(".")+1, "")
                                                    elseif &filetype == 'ruby'
                                                      call setline(1,"#!/usr/bin/env ruby")
                                                        call append(line("."),"# encoding: utf-8")
                                                          call append(line(".")+1, "")
                                                          "    elseif &filetype == 'mkd'
                                                          "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
                                                           else
                                                                 call setline(1, "/*************************************************************************") 
                                                                   call append(line("."), " > File Name: ".expand("%"))
                                                                     call append(line(".")+1, " > Author: ")
                                                                       call append(line(".")+2, " > Mail: ")
                                                                         call append(line(".")+3, " > Created Time: ".strftime("%c"))
                                                                           call append(line(".")+4, " ************************************************************************/") 
                                                                             call append(line(".")+5, "")
                                                                              endif
                                                                              
                                                                               if expand("%:e") == 'cpp'
                                                                                     call append(line(".")+6, "#include<iostream>")
                                                                                       call append(line(".")+7, "using namespace std;")
                                                                                         call append(line(".")+8, "")
                                                                                          endif
                                                                                           if &filetype == 'c'
                                                                                                 call append(line(".")+6, "#include<stdio.h>")
                                                                                                   call append(line(".")+7, "")
                                                                                                    endif
                                                                                                     if expand("%:e") == 'h'
                                                                                                           call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
                                                                                                             call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
                                                                                                               call append(line(".")+8, "#endif")
                                                                                                                endif
                                                                                                                
                                                                                                                 if &filetype == 'java'
                                                                                                                       call append(line(".")+6,"public class ".expand("%:r"))
                                                                                                                         call append(line(".")+7,"")
                                                                                                                          endif
                                                                                                                          "after creating new file, go to the end of the file
                                                                                                                          endfunc
                                                                                                                          autocmd BufNewFile * normal G
                                                                                                                          
                                                                                                                          
                                                                                                                          
                                                                                                                          """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                                          " F5 compile and run
                                                                                                                          """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                                          map <F5> :call CompileRunGcc()<CR>
                                                                                                                          func! CompileRunGcc()
                                                                                                                           exec "w"
                                                                                                                            if &filetype == 'c'
                                                                                                                                  exec "!g++ % -o %<"
                                                                                                                                    exec "!time ./%<"
                                                                                                                                     elseif &filetype == 'cpp'
                                                                                                                                       exec "!g++ % -o %<"
                                                                                                                                         exec "!time ./%<"
                                                                                                                                          elseif &filetype == 'java'
                                                                                                                                            exec "!javac %"
                                                                                                                                              exec "!time java %<"
                                                                                                                                               elseif &filetype == 'sh'
                                                                                                                                                 exec "!time bash %"
                                                                                                                                                  elseif &filetype == 'python'
                                                                                                                                                    exec "!time python %"
                                                                                                                                                     elseif &filetype == 'html'
                                                                                                                                                       exec "!firefox % &"
                                                                                                                                                        elseif &filetype == 'go'
                                                                                                                                                        "        exec "!go build %<"
                                                                                                                                                          exec "!time go run %"
                                                                                                                                                          "    elseif &filetype == 'mkd'
                                                                                                                                                          "        exec "!~/.vim/markdown.pl % > %.html &"
                                                                                                                                                          "        exec "!firefox %.html &"
                                                                                                                                                           endif
                                                                                                                                                           endfunc
                                                                                                                                                           ```
                                                                                                                                                           
###3. install pathogen.vim
                                                                                                                                                           ```
                                                                                                                                                           mkdir -p ~/.vim/autoload ~/.vim/bundle && \
                                                                                                                                                           curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
                                                                                                                                                           ```
                                                                                                                                                           
###4. git and install plug-in
                                                                                                                                                           ```
                                                                                                                                                           cd ~/.vim/
                                                                                                                                                           git init
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
                                                                                                                                                           )"))"')"""```
