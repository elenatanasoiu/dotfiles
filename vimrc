"===========================================================================
"                                ~My vimrc~
"===========================================================================
" Author:        Elena Tanasoiu [http://elenatanasoiu.com]
" Source:        https://github.com/elenatanasoiu/dotfiles
"
" I am using Vundle to manage my plugins, which is configured below
" Each plugin is configured in its own file in ~/.vim/rcplugins
"---------------------------------------------------------------------

syntax on 				              " Activates syntax highlighting
set number 				              " Activate line numbering
set history=500				          " keep 500 lines of command line history
set ruler				                " show the cursor position all the time
set nowrap
set autoindent				
set copyindent                  " Copy previous indentation on autoindenting
set noerrorbells visualbell t_vb=     " Disable error sound
set paste
set tabstop=2                         " Change tabs to 2 spaces
set shiftwidth=2                                    
set expandtab
set autoread                    " Don't ask if I want to reload change file



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
Plugin 'tpope/vim-dispatch'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-emoji'


" Colors 
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Allow vim-rspec to be able to send tests to tmux
let g:rspec_command = "!clear && bundle exec rspec {spec}"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always display status line
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'left': [
      \             ['mode', 'paste'],
      \             ['emojipocalypse'],
      \             ['fugitive', 'readonly', 'myfilename', 'modified']
      \           ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'emojipocalypse': '%{emoji#for("sparkles")}',
      \   'readonly': '%{(&filetype!="help" && &readonly) ? emoji#for("lock") : ""}',
      \ },
      \ 'component_function': {
      \   'myfilename': 'LightLineFilename',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
\ }

function! LightLineFilename()
  let git_root = fnamemodify(fugitive#extract_git_dir(expand("%:p")), ":h")

  if expand("%:t") == ""
    return "Elena"
  elseif git_root != "" && git_root != "."
    return substitute(expand("%:p"), git_root . "/", "", "")
  else
    return expand("%:p")
  endif
endfunction
