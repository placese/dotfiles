call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'navarasu/onedark.nvim'

Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-vinegar'
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vijaymarupudi/nvim-fzf'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'xiyaowong/nvim-transparent'

call plug#end()

" enable tree-sitter for python and js
lua require'tree-sitter'

nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

set signcolumn=number
set updatetime=300
set nobackup
set inccommand=nosplit

nmap <C-t> :tab new <CR>
nmap ,gd <Plug>(coc-definition)
nmap ,gr <Plug>(coc-references)
nmap ,gi <Plug>(coc-implementation)
nmap ,gy <Plug>(coc-type-definition)


" ui options
" --------------------------------------------------------------------------------

lua require'onedarkcolors'
colorscheme onedark
let g:transparent_enabled = v:true
" --------------------------------------------------------------------------------
set cursorline
set ruler
set number
set relativenumber
" set nohlsearch
nnoremap ,<space> :nohlsearch <CR>
set mouse=a
set encoding=utf-8
set number
set noswapfile
set scrolloff=7
" --------------------------------------------------------------------------------
:set noexpandtab
:set copyindent
:set preserveindent
:set softtabstop=0
:set shiftwidth=4
:set tabstop=4
" --------------------------------------------------------------------------------
au BufRead,BufNewFile *.py set expandtab
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

" --------------------------------------------------------------------------------
nnoremap tn :tabnew .<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap ti :tabnew ~/.config/nvim/init.vim<CR>

filetype plugin indent on
