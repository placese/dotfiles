call plug#begin('~/.local/share/nvim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-json

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'navarasu/onedark.nvim'

Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-vinegar'
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vijaymarupudi/nvim-fzf'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'xiyaowong/nvim-transparent'

Plug 'f-person/git-blame.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'm4xshen/autoclose.nvim'


call plug#end()

lua require("autoclose").setup()


lua require'lsp'

let g:better_whitespace_ctermcolor='20B2AA'


lua require'tree-sitter'

nnoremap <c-P> <cmd>lua require('fzf-lua').git_files()<CR>
nnoremap <c-g> <cmd>lua require('fzf-lua').live_grep({ cmd = "git grep --line-number --column --color=always" })<CR>
xnoremap <c-g> <cmd>lua require('fzf-lua').grep_visual({ cmd = "git grep --line-number --column --color=always" })<CR>
nnoremap gs <cmd>lua require('fzf-lua').git_status()<CR>


let g:gitblame_enabled = 0
" :GitBlameToggle to turn on/off gitblame
let g:gitblame_message_template = '<summary> • <date> • <author>'


let mapleader = ","

set nobackup
set updatetime=300
set inccommand=nosplit

set colorcolumn=100

" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gr <Plug>(coc-references)
" nmap <leader>gi <Plug>(coc-implementation)
" nmap <leader>gy <Plug>(coc-type-definition)
" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"

" inoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'



lua require'nvim-tree-settings'

set completeopt=longest,menuone

" ui options
lua require'onedarkcolors'
colorscheme onedark
let g:transparent_enabled = v:true

set cursorline
set ruler
set number
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
set ignorecase

nnoremap <leader><space> :nohlsearch <CR>

" tabs
nnoremap <C-t> :tabnew <CR>
nnoremap tn :tabnew .<CR>
nnoremap td :tabnew %<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap ti :tabnew ~/.config/nvim/init.vim<CR>

" copy
xnoremap <C-c> "+y
noremap <C-S-v> "+p

"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

filetype on
filetype plugin on
filetype plugin indent on
syntax on
so ~/.config/nvim/.vim/after/ftplugins/python.vim
so ~/.config/nvim/.vim/after/ftplugins/yaml.vim
so ~/.config/nvim/.vim/after/ftplugins/make.vim
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
