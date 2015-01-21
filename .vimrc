set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mileszs/ack.vim'
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Lokaltog/powerline'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'spf13/PIV'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'beyondwords/vim-twig'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'spf13/vim-colors'
Plugin 'flazz/vim-colorschemes'
"Plugin 'joonty/vdebug.git'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ','
color zenburn

syntax on

" Formatting
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
"set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
" To disable the stripping of whitespace, add the following to your
" .vimrc.before.local file:
"   let g:spf13_keep_trailing_whitespace = 1
"autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> 
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

highlight clear SignColumn
highlight clear LineNr
set hlsearch
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set number

set wildignore+=app/cache/**/*,*/app/cache/*,*/tmp/*,*.so,*.swp,*.zip

    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
            let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()

set history=1000
set nowrap

:nnoremap <leader>ev :tabe ~/.vimrc<CR>
:nnoremap <leader>sv :source ~/.vimrc<CR>

let g:indent_guides_enable_on_vim_startup = 0

au FileType css setl sw=2 sts=2 et
autocmd BufRead,BufNewFile *.less setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et
"au FileType php setl sw=4 sts=4 ts=4 noexpandtab
au FileType php setl sw=4 sts=4 et

let g:DisableAutoPHPFolding = 0
let g:PIVAutoClose = 0

" CtrlP
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'

set nospell
"set undodir=~/.vimundo/
"set undofile
"set hid

let g:autoclose_vim_commentmode = 1

"Get rid of annoying Press Enter or type command to continue...
let g:bufferline_echo=0

"Airline tweaks
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#bufferline#enabled = 1

" NERDTree
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
map <leader>ms :mksession ~/.session.vim<CR>
map <leader>ss :source ~/.session.vim<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" No fold for you stupid php <PIV>!
set nofoldenable
let g:DisableAutoPHPFolding = 1

let g:vdebug_options = {
    \ 'break_on_open': 1,
    \ 'port': '9001',
    \ 'path_maps': {"/clients/sites/dev/symfony": "/Users/ryan/Code/DIW-web/symfony"},
    \ 'server': ''
    \}

:vmap <C-C> "+y

if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
elseif empty(argv(0))
    bd
    autocmd vimenter * exe "cd ."
    autocmd VimEnter * NERDTree
endif

" Sessions
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    if !exists('g:override_spf13_bundles')
        set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
