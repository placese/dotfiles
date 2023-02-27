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


lua require'tree-sitter'

nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

let mapleader = ","

set nobackup
set updatetime=300
set inccommand=nosplit

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gy <Plug>(coc-type-definition)

" ui options
lua require'onedarkcolors'
colorscheme onedark
let g:transparent_enabled = v:true

set cursorline
set ruler
set relativenumber
set mouse=a
set encoding=utf-8
set noswapfile
set scrolloff=7
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set backspace=indent,eol,start

nnoremap <leader><space> :nohlsearch <CR>

" tabs
nnoremap <C-t> :tabnew <CR>
nnoremap tn :tabnew .<CR>
nnoremap td :tabnew %<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap ti :tabnew ~/.config/nvim/init.vim<CR>

filetype on
filetype plugin on
filetype plugin indent on
syntax on
so ~/.config/nvim/.vim/after/ftplugins/python.vim
so ~/.config/nvim/.vim/after/ftplugins/yaml.vim
so ~/.config/nvim/.vim/after/ftplugins/make.vim
