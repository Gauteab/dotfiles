
" Setup Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'sheerun/vim-polyglot'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'dkasak/gruvbox'
call plug#end()

" Custom stuff

set wildmenu
set hidden
set incsearch
set backspace=indent,eol,start

" by default, the indent is 2 spaces. 
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nowrap

colo gruvbox
set background=dark

" Toggle hybrid line numbers with \l
map <leader>l :setlocal number! relativenumber!<cr>
" Open vimrc with \e
map <leader>e :e  $MYVIMRC<cr>
"Ssource vimrc with \s
map <leader>s :so $MYVIMRC<cr>
" Run currently open python file with \p
map <leader>p :w<cr> :! python %<cr>

