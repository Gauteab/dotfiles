" ln -sf $DOTFILES/vimrc $HOME/.vimrc

" Setup Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'sheerun/vim-polyglot'
	"Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'dkasak/gruvbox'
	Plug 'w0rp/ale'
	Plug 'udalov/kotlin-vim'
	Plug 'rust-lang/rust.vim'
	"Plug 'vim-syntastic/syntastic'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	" Deoplete and dependencies
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'tpope/vim-commentary'
call plug#end()

" Enable Deoplete
let g:deoplete#enable_at_startup = 1

" Fix Kitty Background Bug
let &t_ut=''

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre   *.class let &bin=1
  au BufReadPost  *.class %!xxd
  au BufReadPost  *.class set ft=xxd
  au BufWritePre  *.class %!xxd -r
  au BufWritePost *.class %!xxd
  au BufWritePost *.class set nomod | endif
augroup END

" hex
map <leader>w :wa<cr> :! python hex.py %<cr>
set autoread

" Custom stuff
set wildmenu
set hidden
set incsearch
set backspace=indent,eol,start
set noswapfile " Disbale auto backup
set scrolloff=4 " Always 4 lines around cursor
set mouse=a

" Theme
colo gruvbox
set background=dark

" Default indent set to 4
set tabstop=4 " To match the sample file
set softtabstop=2
set shiftwidth=2
set expandtab " Use tabs, not spaces

set nowrap

" Toggle hybrid line numbers with \l
map <leader>l :setlocal number! relativenumber!<cr>
" Open vimrc with \e
map <leader>e :e  $MYVIMRC<cr>
"Source vimrc with \s
map <leader>s :w<cr> :so $MYVIMRC<cr>
" Run currently open python file with \p
map <leader>p :w<cr> :! python %<cr>
" Return to previous buffer
map <leader>b :bp<cr>
" Comment out paragraph
map <leader>g gcip
" Windowing
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" Split Windows
map <leader>\| :vs<cr>
map <leader> - :sp<cr>
" Exit terminal mode with ESC
tnoremap <ESC> <C-\><C-n>

" Previous buffer
map <C-e> :e#<cr>

" == ALE ==
let g:ale_enabled = 0
nnoremap <leader>o :ALEToggle<CR>

