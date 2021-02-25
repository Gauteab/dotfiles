" Setup Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
    " Editing
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
	Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " Navigation
    Plug 'easymotion/vim-easymotion'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " IDE
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
	Plug 'w0rp/ale'
	Plug 'SirVer/ultisnips' " Snippet engine
	Plug 'honza/vim-snippets' " Snippet collection
	Plug 'sheerun/vim-polyglot' " Syntax Highlighting for many languages
    Plug 'vim-airline/vim-airline'
    Plug 'monkoose/fzf-hoogle.vim'

    " Misc
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
	Plug 'dkasak/gruvbox' " theme
    Plug 'chrisbra/Colorizer' " highlight color codes
    Plug 'christoomey/vim-run-interactive'
call plug#end()

" Set leader to space
let mapleader = " "

" Markdown Preview
let g:mkdp_auto_close = 0

" EasyAlign
nmap ga <Plug>(EasyAlign)

" Easy Motion
nmap <C-M> <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

" Load a template
nnoremap <leader>tl :r ~/templates/

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Custom stuff
syntax on
filetype on
filetype plugin indent on
set ignorecase
set smartcase
set wildmenu
set hidden
set incsearch
set backspace=indent,eol,start
set noswapfile " Disbale auto backup
set scrolloff=8 " Scroll offset
set mouse=a " Make the mouse work
set clipboard=unnamed " vim and os use same clipboard
set inccommand=nosplit
" Theme
colo gruvbox
set background=dark
" Default indent set to 4
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set number relativenumber

map <space>ee :e  ~/dotfiles/vimrc<cr>
map <space>ev :vs  ~/dotfiles/vimrc<cr>
map <space>es :sp  ~/dotfiles/vimrc<cr>
map <space>so :w<cr> :source $MYVIMRC<cr> 
" Return to previous buffer
map <space>b :e#<cr>
map <space><space>b :Buffers<cr>
" Windowing
map <space>vs :vs<cr>
map <space>sp :sp<cr>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

nnoremap <space>ho :Hoogle<cr>
" Exit terminal mode with ESC
tnoremap <ESC> <C-\><C-n>

set autoread

" == COC ==
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>co :CocList --number-select outline<CR>
nmap <leader>cs :CocList --number-select -I symbols<CR>
nmap <leader>cl :CocList --number-select <CR>
nmap <leader>ch :call CocAction('doHover')<CR>
" nmap <leader>cf :call CocAction('format')<CR>
nmap <leader>cf :CocFix<CR>
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>ci  <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>ce <Plug>(coc-codelens-action)
nmap <silent> <C-b> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

" == ALE ==
function! FormatHaskell(buffer) abort
    return { 'command': 'fourmolu --indentation 2 --indent-wheres true' }
endfunction

execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')

let g:ale_linters_explicit = 1
let g:ale_fixers = { 
\  'purescript': ['purty'],
\  'haskell': ['fourmolu']
\}

let g:ale_enabled = 1
" let g:ale_linters = { 'haskell': ['hlint'] }
" let g:ale_fixers = {'haskell': ['hlint']}
" let g:ale_fixers = { 'purescript': ['purty'], 'haskell': ['hindent'], 'c': ['clang-format'], 'elm': ['elm-format'], 'python': ['autopep8'], 'java': ['google_java_format']}
let g:ale_java_google_java_format_options = '-i'
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '--style=WebKit'

map <space>at :ALEToggle<CR>
map <space>af :ALEFix<CR>
map <space>ap :ALEPrevious<CR>
map <space>an :ALENextWrap<CR>

" Make title readable by talon
function! SetTitle()
    let &titlestring ='VIM MODE:%{mode()} RPC:%{v:servername} | %F'
    " let &titlestring ='VIM MODE:%{mode()} RPC:%{v:servername} - (%f) %t'
    " let &titlestring ='VIM MODE:%{mode()} - (%f) %t'
    set title
endfunction

augroup configgroup
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " autocmd CursorHold * silent call CocActionAsync('doHover')
    autocmd BufEnter * call SetTitle()
    autocmd BufEnter *.pl setlocal filetype=prolog
    autocmd BufEnter *.talon setlocal filetype=conf
    autocmd BufEnter *.tex setlocal filetype=tex
    autocmd BufEnter *.talon setlocal commentstring=#\ %s
    autocmd BufEnter *.purs setlocal commentstring=--\ %s
    autocmd BufEnter *.bib setlocal commentstring=%\ %s
    autocmd BufEnter *.purs,*.hs,*.ts,*.tsx setlocal tabstop=2
    autocmd BufEnter *.purs,*.hs,*.ts,*.ts* setlocal shiftwidth=2
    autocmd BufEnter *.purs,*.hs,*.ts,*.ts* setlocal softtabstop=2
    autocmd BufEnter *.elm nnoremap <buffer> <leader>ta 0ywkpA: 
    autocmd BufEnter *.hs,*.purs nnoremap <buffer> <leader>ta 0ywkpA:: 
    " autocmd BufWritePost *.hs silent call Fourmolu()
augroup END

augroup runable
    autocmd FileType python map <F9> :w<CR>:!python3 %<CR>
    autocmd FileType elm map <F9> :w<CR>:!elm-run %<CR>
    autocmd FileType haskell map <F9> :w<CR>:!runhaskell %<CR>
    autocmd FileType purescript map <F9> :w<CR>:!spago run<CR>
    autocmd FileType tex map <F9> :w<CR>:!pdflatex %<CR>
    autocmd FileType teraterm map <F9> :w<CR>:!ttl %<CR>
    autocmd FileType markdown map <F9> :w<CR>:!pandoc % -o %:r.pdf<CR>
    autocmd FileType bash map <F9> :w<CR>:!./%<CR>
    autocmd FileType typescript map <F9> :w<CR>:!ts-node %<CR>
    autocmd FileType javascript map <F9> :w<CR>:!node %<CR>
augroup END

" Make searching nicer
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" === FZF ===
map <space>g :Files<CR>
map <space>rg :Rg<CR>
" map <space><space> :Commands<CR>
" Preview in :Files
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" augroup talon_coc
"     autocmd!
"     autocmd BufEnter,BufWritePre *.ts,*.tsx,*.elm silent call SaveDocumentSymbols()
" augroup END

augroup talon_coc
    autocmd!
    autocmd BufEnter,BufWritePost *.elm silent call TalonUpdateSymbols()
augroup END

function SaveWorkspaceSymbols()
    let symbols = CocAction('getWorkspaceSymbols')
    let symbols = json_encode(symbols)
    let file = "/Users/gauteab/uio/master/thesis/workspaceSymbols.json"
    " let file = "/Users/gauteab/.talon/user/lsp/workspaceSymbols.json"
    call writefile([symbols], file)
endfunction

function SaveDocumentSymbols()
    echo "saving document symbols"
    let symbols = CocAction('documentSymbols')
    let symbols = json_encode(symbols)
    let file = "/Users/gauteab/uio/master/thesis/documentSymbols.json"
    " let file = "/Users/gauteab/.talon/user/lsp/documentSymbols.json"
    call writefile([symbols], file)
endfunction

function TalonUpdateSymbols()
    execute "!curl 'localhost:8080/update-symbols?file=%:p'"
endfunction


