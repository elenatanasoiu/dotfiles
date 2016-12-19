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
set noerrorbells visualbell t_vb=
set paste
set tabstop=2
set shiftwidth=2
set expandtab

"colorscheme jellybeans

let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr> 	" Open vimrc file
nmap <leader>so :source $MYVIMRC<cr> 	" Reload vimrc file
nmap j gj " Scroll down through wrapped lines 
nmap k gk " Scroll up through wrapped lines
imap jk <esc> " Escaping from insert mode, normally done with ESC or <C-[>
imap kj <esc> " Escaping from insert mode, normally done with ESC or <C-[>
map <leader>co mmggVG"*y`m  		" copy the entire contents of a file to the system register
"map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
"Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-dispatch'
Plugin 'itchyny/lightline.vim'

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

" PLUGIN SETTINGS
"================
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Allow vim-rspec to be able to send tests to tmux
let g:rspec_command = "!clear && bundle exec rspec {spec}"
"For vim-tmux-runner: let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"

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


