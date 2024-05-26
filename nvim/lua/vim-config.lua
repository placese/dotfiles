vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set backspace=indent,eol,start")
vim.cmd("set ignorecase")
vim.g.mapleader = ","
vim.cmd("nnoremap <leader><space> :nohlsearch <CR>")

vim.cmd("set nobackup")
vim.cmd("set updatetime=300")
vim.cmd("set inccommand=nosplit")

vim.cmd("let g:transparent_enabled = v:true")

vim.cmd("set colorcolumn=100")
vim.cmd("set cursorline")
vim.cmd("set ruler")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set mouse=a")
vim.cmd("set encoding=utf-8")
vim.cmd("set noswapfile")
vim.cmd("set scrolloff=7")
vim.cmd("hi Search guibg=plum guifg=cornsilk")

-- tabs
vim.cmd("nnoremap <C-t> :tabnew <CR>")
vim.cmd("nnoremap tn :tabnew .<CR>")
vim.cmd("nnoremap td :tabnew %<CR>")
vim.cmd("nnoremap tl :tabnext<CR>")
vim.cmd("nnoremap th :tabprevious<CR>")
vim.cmd("nnoremap ti :tabnew ~/.config/nvim/init.lua<CR>")

-- copy
vim.cmd('xnoremap <C-c> "+y')
vim.cmd('noremap <C-S-v> "+p')

-- Move around in the insert mode
vim.cmd("inoremap <C-k> <C-o>gk")
vim.cmd("inoremap <C-h> <Left>")
vim.cmd("inoremap <C-l> <Right>")
vim.cmd("inoremap <C-j> <C-o>gj")

vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
