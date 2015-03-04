set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matchit.zip'
Plugin 'spf13/PIV'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'beyondwords/vim-twig'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'spf13/vim-colors'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'joonty/vdebug.git'
call vundle#end()            " required
filetype plugin indent on    " required

color zenburn
syntax on

hi MatchParen cterm=bold ctermbg=white ctermfg=black

let mapleader = ','
let g:bufferline_echo=0 "Get rid of annoying Press Enter or type command to continue...

" Formatting
set nowrap                      " Do not wrap long lines
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set showmode
set backspace=indent,eol,start  " Fix backspace
set hlsearch                    " Highlight search
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set number
set nospell
set history=1000
set wildignore+=app/cache/**/*,*/app/cache/*,*/tmp/*,*.so,*.swp,*.zip
set nofoldenable
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set clipboard=unnamed           " Yank yanks to clipboard
set laststatus=2                " Always show powerline

" File Indentation
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
au FileType css setl sw=2 sts=2 et
au FileType scss setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et
au FileType php setl sw=4 sts=4 et
au FileType haskell,puppet,ruby,yml setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
au BufRead,BufNewFile *.less setl sw=2 sts=2 et
au BufNewFile,BufRead *.html.twig set filetype=html.twig
au BufNewFile,BufRead *.coffee set filetype=coffee

" Directories
set backupdir=$HOME/.vim
set viewdir=$HOME/.vim
set directory=$HOME/.vim
set undodir=$HOME/.vim

" Mappings
:vmap <C-C> "+y
:nnoremap <leader>ev :tabe ~/.vimrc<CR>
:nnoremap <leader>sv :source ~/.vimrc<CR>
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" CtrlP via ag
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'

" NERDTree
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
elseif empty(argv(0))
    bd
    autocmd vimenter * exe "cd ."
    autocmd VimEnter * NERDTree
endif

" PIV
let g:DisableAutoPHPFolding = 1

" Sessions
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Vdebug
let g:vdebug_options = {
\ 'break_on_open': 1,
\ 'port': '9001',
\ 'path_maps': {"/clients/sites/dev/symfony": $HOME."/Code/DIW-web/symfony"},
\ 'server': ''
\}
