call plug#begin('~/.local/share/nvim/plugged')

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

Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'

Plug 'folke/neodev.nvim'


call plug#end()

nnoremap <leader>md :MarkdownPreview<CR>

lua require"debugging"

" lua require('dap')
" lua require('dapui').setup()
" lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
" lua require'_dap-settings'
" nnoremap <leader>dc <Cmd>lua require'dap'.continue()<CR>
" nnoremap <leader>dj <Cmd>lua require'dap'.step_over()<CR>
" nnoremap <leader>dl <Cmd>lua require'dap'.step_into()<CR>
" nnoremap <leader>dJ <Cmd>lua require'dap'.step_out()<CR>
" nnoremap <Leader>db <Cmd>lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <Leader>dB <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <Leader>dlp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
" nnoremap <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
"
" nnoremap <leader>dn <Cmd>lua require('dap-python').test_method()<CR>
" nnoremap <leader>df <Cmd>lua require('dap-python').test_class()<CR>
" vnoremap <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

lua require("autoclose").setup({options = {disable_when_touch=true, touch_regex="[%w(%[{\'\"]"}})
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

hi Search guibg=plum guifg=cornsilk

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
