" Setup Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-easy-align'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'christoomey/vim-run-interactive'
    Plug 'tpope/vim-surround'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'lervag/vimtex'
	Plug 'sheerun/vim-polyglot'
	Plug 'dkasak/gruvbox'
	Plug 'w0rp/ale'
	Plug 'udalov/kotlin-vim'
	Plug 'rust-lang/rust.vim'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
    " Plug 'neovimhaskell/haskell-vim'
	" Deoplete and dependencies
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'tpope/vim-commentary'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:mkdp_auto_close = 0

" Enable Deoplete
let g:deoplete#enable_at_startup = 1

" Fix Kitty Background Bug
let &t_ut=''

nmap ga <Plug>(EasyAlign)

" map <space>f <Plug>(easymotion-bd-f)
map <enter> <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Custom stuff
set ignorecase
set smartcase
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
set expandtab

set nowrap

" Toggle hybrid line numbers with \l
set number relativenumber
map <space>n :set number! relativenumber!<cr>
" Open vimrc with \e
map <space>e :e  ~/dotfiles/vimrc<cr>
"Source vimrc with \s
map <space>so :w<cr> :so $MYVIMRC<cr>
" Return to previous buffer
map <space>b :e#<cr>
map <space>vs :vs<cr>
map <space>sp :sp<cr>
" Windowing
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" Exit terminal mode with ESC
tnoremap <ESC> <C-\><C-n>

" == COC ==
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" == ALE ==
let g:ale_enabled = 0
" let g:ale_linters = { 'haskell': ['hlint'] }
let g:ale_fixers = { 'haskell': ['brittany'], 'c': ['clang-format'], 'elm': ['elm-format']}
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '-style=WebKit'
map <space>at :ALEToggle<CR>
map <space>af :ALEFix hindent<CR>
map <space>ap :ALEPrevious<CR>
map <space>an :ALENextWrap<CR>

augroup configgroup
    autocmd!
    autocmd BufEnter *.pl setlocal filetype=prolog
    autocmd BufEnter *.hs setlocal tabstop=2
    autocmd BufEnter *.hs setlocal shiftwidth=2
    autocmd BufEnter *.hs setlocal softtabstop=2
augroup END

autocmd FileType python map <F9> :w<CR>:!python %<CR>
autocmd FileType haskell map <F9> :w<CR>:!runhaskell %<CR>
autocmd FileType teraterm map <F9> :w<CR>:!ttl %<CR>
autocmd FileType markdown map <F9> :w<CR>:!pandoc % -o %:r.pdf<CR>
autocmd FileType bash map <F9> :w<CR>:!./%<CR>

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" === FZF ===
map <space>g :Files<CR>
map <space>rg :Rg<CR>

" Preview in :Files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction

autocmd BufEnter * call SetTerminalTitle()

command! -nargs=+ Calc :!python -c "from math import *; print(<args>)"
