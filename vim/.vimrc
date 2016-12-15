"===========================================================================
"                                ~My vimrc~
"===========================================================================
" Author:        Elena Tanasoiu [http://elenatanasoiu.com]
" Source:        https://github.com/elenatanasoiu/dotfiles
"
" I am using Vundle to manage my plugins, which is configured below
" Each plugin is configured in its own file in ~/.vim/rcplugins
"---------------------------------------------------------------------

syntax on 				" Activates syntax highlighting
set number 				" Activate line numbering
set history=500				" keep 500 lines of command line history
set ruler				" show the cursor position all the time
set nowrap
set autoindent				

" colorscheme jellybeans

let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr> 	" Open vimrc file
nmap <leader>so :source $MYVIMRC<cr> 	" Reload vimrc file

" Scroll down through wrapped lines 
nmap j gj 
nmap k gk

" Escaping from insert mode, normall done with ESC or <C-[>
imap jk <esc>
imap kj <esc>

map <leader>co mmggVG"*y`m  		" copy the entire contents of a file to the system register

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" Colors 
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>



