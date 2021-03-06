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

set cursorline 
hi CursorLineNr guifg=#d3869b

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
" Plug 'lervag/vimtex'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'L3MON4D3/LuaSnip'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'puremourning/vimspector'
" Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim'
Plug 'windwp/nvim-autopairs'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'mxw/vim-jsx'
" Plug 'bfrg/vim-cpp-modern'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoob3rt/lualine.nvim'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'sbdchd/neoformat'
Plug 'TimUntersberger/neogit'
" Plug 'pangloss/vim-javascript'
" Plug 'mhartington/formatter.nvim'

call plug#end()

" gruvbox settings
let g:gruvbox_bold = '0'
let g:gruvbox_improved_warnings = '1'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent = 'true'
colorscheme gruvbox-flat

set splitbelow
set switchbuf=newtab
nnoremap \\ :spl<CR>:term<CR>
" source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/telescope-config.rc.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim
source $HOME/.config/nvim/plug-config/neoformat.rc.vim
luafile $HOME/.config/nvim/plug-config/treesitter-config.lua
" luafile $HOME/.config/nvim/plug-config/compe-config.lua
luafile $HOME/.config/nvim/plug-config/nvim-cmp.lua
luafile $HOME/.config/nvim/plug-config/python-config.lua
" luafile $HOME/.config/nvim/plug-config/latex-config.lua
luafile $HOME/.config/nvim/plug-config/javascript-config.lua
luafile $HOME/.config/nvim/plug-config/cpp-config.lua
luafile $HOME/.config/nvim/plug-config/lualine-config.lua
luafile $HOME/.config/nvim/plug-config/lspsaga-config.lua
luafile $HOME/.config/nvim/plug-config/autopair-config.lua
luafile $HOME/.config/nvim/plug-config/rust-config.lua
" luafile $HOME/.config/nvim/plug-config/formattr-config.lua
" luafile $HOME/.config/nvim/plug-config/denols-config.lua

" nnoremap <space>e :CocCommand explorer --preset floating<CR> 
" remap space to confirm compe 
" inoremap <silent><expr> <Space>      compe#confirm('<Space>')
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

hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineHint gui=undercurl
hi DiagnosticUnderlineWarn gui=undercurl
hi CursorLine guibg=None
hi CmpItemAbbr guibg=#282828 guifg=#7c6f64
hi CmpItemKind guibg=#282828 guifg=#ea6962

" VimTex
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'emacsclient -c'
" 
" " Or with a generic interface:
" let g:vimtex_view_general_viewer = 'emacsclient'
" " let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options = '-c file:@pdf\#src:@line@tex'
" 
" " VimTeX uses latexmk as the default compiler backend. If you use it, which is
" " strongly recommended, you probably don't need to configure anything. If you
" " want another compiler backend, you can change it as follows. The list of
" " supported backends and further explanation is provided in the documentation,
" " see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'
" 
" " Most VimTeX mappings rely on localleader and this can be changed with the
" " following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","
