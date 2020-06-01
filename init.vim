" How to install plug: https://github.com/junegunn/vim-plug

" Plugins Below
call plug#begin('~/.nvim/plugged')
" better file tree
Plug 'scrooloose/nerdtree'
" find files using fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" colorscheme
Plug 'morhetz/gruvbox'
" auto complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" multi cursor with Control - N
Plug 'terryma/vim-multiple-cursors'
call plug#end()
" Plugins Above

" move with mouse
set mouse=a

" show numbers
set number

" whitespace configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab " converts tabs to spaces
set autoindent 
set shiftround " rounds shifts to multiple of shiftwidth
set smarttab " :help smarttab
" end whitespace configuration

" ruler in bottom right
set ruler
set showcmd

" error bells configuration
set noerrorbells
set visualbell
" end error bells configuration

" backspace over eol
set backspace=indent,eol,start

" read changes from file
set autoread

" dont wrap lines
set nowrap

filetype indent on

" command completion
set wildmenu

" search configuration
set showmatch
" Toggle search highlighting with Control + S
nnoremap <C-s> :call ToggleHighlighting()<Enter>
set incsearch
set hlsearch
let g:hl='yes'
function! ToggleHighlighting()
    if g:hl == 'yes'
        set nohlsearch
        let g:hl='no'
    else
        set hlsearch
        let g:hl='yes'
    endif
endfunction
nnoremap <C-s> :call ToggleHighlighting()<Enter>
" end search configuration

" folding configuration
set foldenable
set foldlevelstart=10
set foldnestmax=10
" toggle folding with space
nnoremap <space> za
set foldmethod=indent
" end folding configuration

set lazyredraw

" swap file configuration
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
" end swap file configuration

" nerdtree open with Control T remap
nnoremap <C-t> :NERDTree<Enter>

" disable ex mode
map Q <Nop>

" use system clipboard for macvim
set clipboard=unnamed

" control p config
set wildignore+=/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_extensions = [ 'dir', 'line', 'mixed' ]
noremap <C-S-p> :CtrlPLine<Enter>
" end control p config

" coc configuration
set signcolumn=yes
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" end coc configuration

" colorscheme setup
syntax enable
set background=dark
let g:bg='dark'
function! SwapBackground()
    if g:bg == "light"
        set background=dark
        let g:bg="dark"
    else
        set background=light
        let g:bg="light"
    endif
endfunction
" Toggle Background Light/Dark with Control + I
nnoremap <C-i> :call SwapBackground()<Enter>
autocmd vimenter * colorscheme gruvbox
" end colorscheme setup

" highlight trailing whitespace and tabs
set list listchars=trail:~,tab:>-
