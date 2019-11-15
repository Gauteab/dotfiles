" Setup Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
    Plug '/usr/local/opt/fzf'
    Plug 'lervag/vimtex'
	Plug 'sheerun/vim-polyglot'
	Plug 'dkasak/gruvbox'
	Plug 'w0rp/ale'
	Plug 'udalov/kotlin-vim'
	Plug 'rust-lang/rust.vim'
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
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Custom stuff
set wildmenu
set hidden
set incsearch
set backspace=indent,eol,start
set noswapfile " Disbale auto backup
set scrolloff=4 " Always 4 lines around cursor
set mouse=a
set clipboard=unnamed
set inccommand=nosplit

" Theme
colo gruvbox
set background=dark

" Default indent set to 4
set tabstop=4 " To match the sample file
set softtabstop=4
set shiftwidth=4
set expandtab " Use tabs, not spaces

set nowrap

" Toggle hybrid line numbers with \l
set number! relativenumber!
map <leader>l :set number! relativenumber!<cr>
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

autocmd FileType python map <F9> :w<CR>:!python %<CR>
autocmd FileType haskell map <F9> :w<CR>:!runhaskell %<CR>

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
