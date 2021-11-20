set encoding=utf-8
set termguicolors
set title
set nowrap
set number relativenumber
set noswapfile
set backspace=indent,eol,start
set scrolloff=1
set hidden
set autoread
set mouse=a

" tnoremap <Esc> <C-\><C-n>

set tabstop=4
set softtabstop=4
set shiftwidth=4

" set up indentations for each filetype
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 smartindent
au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql
au BufRead,BufNewFile *.fish setfiletype fish
set expandtab
set autoindent
set fileformat=unix

" run python files
autocmd FileType python nmap \r :w<CR>:split term://python3 %<CR>
    

call plug#begin('~/.vim/plugged')

Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rinx/lspsaga.nvim'
Plug 'sbdchd/neoformat'
Plug 'TimUntersberger/neogit'

call plug#end()

" gruvbox settings
let g:gruvbox_bold = '0'
let g:gruvbox_improved_warnings = '1'
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_transparent = 'true'
colorscheme gruvbox-flat

set splitbelow
set switchbuf=newtab
nnoremap \\ :Lspsaga open_floaterm<CR>
source $HOME/.config/nvim/plug-config/telescope-config.rc.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim
source $HOME/.config/nvim/plug-config/neoformat.rc.vim
luafile $HOME/.config/nvim/plug-config/treesitter-config.lua
luafile $HOME/.config/nvim/plug-config/nvim-cmp.lua
luafile $HOME/.config/nvim/plug-config/python-config.lua
luafile $HOME/.config/nvim/plug-config/javascript-config.lua
luafile $HOME/.config/nvim/plug-config/cpp-config.lua
luafile $HOME/.config/nvim/plug-config/lualine-config.lua
luafile $HOME/.config/nvim/plug-config/lspsaga-config.lua
luafile $HOME/.config/nvim/plug-config/autopair-config.lua
luafile $HOME/.config/nvim/plug-config/rust-config.lua
" mapping leader key
let g:mapleader = " "
" remap for lspsaga
nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>Lspsaga show_line_diagnostics<CR>
" remap for switching splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" remap for closing buffer
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>ca :Lspsaga code_action<CR>
nnoremap <leader>cra :Lspsaga range_code_action<CR>
nnoremap <leader>rn :Lspsaga rename<CR>

