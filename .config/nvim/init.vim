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
set guicursor=n-v-c-i-sm:block,r-cr-o:hor20

set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set cursorline
hi CursorLineNr guifg=#d3869b

" tnoremap <Esc> <C-\><C-n>

set tabstop=4
set softtabstop=4
set shiftwidth=4

" set up indentations for each filetype
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 smartindent
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 smartindent
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 smartindent
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 smartindent
autocmd FileType nasm highlight nasmGen32Register guifg=#89b482
autocmd FileType nasm highlight nasmGen64Register guifg=#89b482
au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql
au BufRead,BufNewFile *.fish setfiletype fish
set expandtab
set autoindent
set fileformat=unix

" run python files
autocmd FileType python nmap \r :w<CR>:botright split term://python3 %<CR>:resize 15<CR>

" compile and run rust files
autocmd FileType rust nmap \r :w<CR>:botright split term://cargo run<CR>:resize 15<CR>

nmap \w :w<CR>
" augroup fmt
"     autocmd!
"     autocmd BufWritePre * undojoin | Autoformat
" augroup END

call plug#begin('~/.vim/plugged')

Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

Plug 'elkowar/yuck.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'akinsho/git-conflict.nvim'
" Plug 'vim-autoformat/vim-autoformat'
" Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'Username-08/gruvbox-flat.nvim'
Plug 'morhetz/gruvbox'
Plug 'numToStr/Comment.nvim'
Plug 'sainnhe/everforest'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" vimtex
Plug 'lervag/vimtex'

Plug 'ggandor/leap.nvim'
Plug 'alvan/vim-closetag'
Plug 'sainnhe/gruvbox-material'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'debugloop/telescope-undo.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/lspsaga.nvim'
Plug 'sbdchd/neoformat'
Plug 'NeogitOrg/neogit'

" Plug 'andweeb/presence.nvim'
" Plug 'pangloss/vim-javascript'
" Plug 'mhartington/formatter.nvim'
" Plug 'lervag/vimtex'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'ryanoasis/vim-devicons'
" Plug 'tami5/lspsaga.nvim'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'mxw/vim-jsx'
" Plug 'bfrg/vim-cpp-modern'
" Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim'
"

call plug#end()

" gruvbox settings
let g:gruvbox_bold = '0'
let g:gruvbox_improved_warnings = '1'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent = 'true'
colorscheme gruvbox-flat
let g:gruvbox_material_foreground = 'original'
let g:gruvbox_material_transparent_background = 1

" let g:everforest_background='hard'
" let g:everforest_enable_italic = 1
" let g:everforest_better_performance = 1
" let g:everforest_transparent_background = 1
" colorscheme everforest


set splitbelow
set switchbuf=newtab
" source $HOME/.config/nvim/plug-config/coc.vim
luafile $HOME/.config/nvim/plug-config/noice-config.lua
luafile $HOME/.config/nvim/plug-config/nonicons-config.lua
source $HOME/.config/nvim/plug-config/telescope-config.rc.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim
source $HOME/.config/nvim/plug-config/neoformat.rc.vim
source $HOME/.config/nvim/plug-config/vimtex.rc.vim
luafile $HOME/.config/nvim/plug-config/treesitter-config.lua
luafile $HOME/.config/nvim/plug-config/gitconflict.lua
" luafile $HOME/.config/nvim/plug-config/compe-config.lua
luafile $HOME/.config/nvim/plug-config/luasnip-config.lua
luafile $HOME/.config/nvim/plug-config/nvim-cmp.lua
luafile $HOME/.config/nvim/plug-config/dap-config.lua
" luafile $HOME/.config/nvim/plug-config/python-config.lua
" luafile $HOME/.config/nvim/plug-config/latex-config.lua
" luafile $HOME/.config/nvim/plug-config/javascript-config.lua
" luafile $HOME/.config/nvim/plug-config/cpp-config.lua
luafile $HOME/.config/nvim/plug-config/lualine-config.lua
luafile $HOME/.config/nvim/plug-config/lspsaga-config.lua
luafile $HOME/.config/nvim/plug-config/autopair-config.lua
luafile $HOME/.config/nvim/plug-config/comment-config.lua
luafile $HOME/.config/nvim/plug-config/toggleterm-config.lua
luafile $HOME/.config/nvim/plug-config/neogit-config.lua
" luafile $HOME/.config/nvim/plug-config/rust-config.lua
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
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
" remap for closing buffer
nnoremap <silent><leader>bd :bdelete<CR>
nnoremap <silent><leader>bn :bnext<CR>
nnoremap <silent><leader>bp :bprevious<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
nnoremap <silent><leader>cra :Lspsaga range_code_action<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>

hi DiagnosticWarn guifg=#d8a657
hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineHint gui=undercurl guisp=#89b482
hi DiagnosticUnderlineWarn gui=undercurl
hi CursorLine guibg=None

highlight! CmpPmenuBorder guifg=#7c6f64 guibg=#32302f
highlight! CmpPmenu guibg=#32302f
hi CmpItemKindEnum guifg=#d8a657
hi CmpItemKindEnumMember guifg=#d8a657
hi CmpItemKindClass guifg=#d8a657
hi CmpItemKindStruct guifg=#d8a657
hi CmpItemKindModule guifg=#d8a657
hi CmpItemKindModule guifg=#d8a657
hi CmpItemKindInterface guifg=#d8a657
hi CmpItemKindConstant guifg=#d8a657
hi CmpItemKindSnippet guifg=#d3869b
hi CmpItemKindKeyword guifg=#d3869b
hi CmpItemKindMethod guifg=#7daea3
hi CmpItemKindFunction guifg=#7daea3
hi CmpItemKindConstructor guifg=#7daea3
hi CmpItemKindProperty guifg=#89b482
hi CmpItemKindField guifg=#89b482
hi CmpItemKindFolder guifg=#a9b665
hi CmpItemKindFile guifg=#a9b665

hi CmpItemAbbr guifg=#7c6f64
hi PmenuSel guibg=#a9b665 guifg=#32302f

" highlight! CmpPmenuBorder guifg=#7a8478 guibg=#2b3339
" highlight Cursor guifg=#7fbbb3
"
" hi CmpItemAbbr guifg=#7a8478

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <A-n> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<A-n>'
" -1 for jumping backwards.
inoremap <silent> <A-n> <cmd>lua require'luasnip'.jump(1)<Cr>
inoremap <silent> <A-p> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <A-n> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <A-p> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E>luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E>luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" lspsaga
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<Cr>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<Cr>


hi SagaWinbarKey           guifg=#ea6962
hi SagaWinbarEnum  guifg=#d8a657
hi SagaWinbarFile         guifg=#a9b665
hi SagaWinbarNull          guifg=#e78a4e
hi SagaWinbarArray         guifg=#7daea3
hi SagaWinbarClass        guifg=#d8a657
hi SagaWinbarEvent         guifg=#7daea3
hi SagaWinbarField         guifg=#89b482
hi SagaWinbarMacro        guifg=#e78a4e
hi SagaWinbarMethod        guifg=#89b482
hi SagaWinbarModule       guifg=#d8a657
hi SagaWinbarNumber        guifg=#e78a4e
hi SagaWinbarObject       guifg=#d8a657
hi SagaWinbarString        guifg=#a9b665
hi SagaWinbarStruct       guifg=#d8a657
hi SagaWinbarBoolean       guifg=#e78a4e
hi SagaWinbarPackage       guifg=#e78a4e
hi SagaWinbarConstant      guifg=#d8a657
hi SagaWinbarFunction     guifg=#7daea3
hi SagaWinbarOperator      guifg=#e78a4e
hi SagaWinbarProperty      guifg=#89b482
hi SagaWinbarVariable     guifg=#ea6962
hi SagaWinbarInterface    guifg=#d8a657
hi SagaWinbarNamespace    guifg=#d8a657
hi SagaWinbarParameter     guifg=#89b482
hi SagaWinbarTypeAlias     guifg=#d8a657
hi SagaWinbarEnumMember   guifg=#d8a657
hi SagaWinbarConstructor   guifg=#89b482
hi SagaWinbarStaticMethod  guifg=#89b482
hi SagaWinbarPreviewBorder guifg=#7c6f64
hi SagaWinbarTypeParameter  guifg=#89b482
hi SagaWinbarFilename       guifg=#d4be98
hi SagaWinbarFoldername       guifg=#d4be98
hi SagaWinbarSep            guifg=#7c6f64
hi Title       guifg=#d4be98

nnoremap <silent> gd :Lspsaga goto_definition<CR>
nnoremap <silent> gr :Lspsaga lsp_finder<CR>

nnoremap  <leader>ot :Lspsaga outline<CR>
nnoremap \\ :ToggleTerm<CR>

" leap nvim
lua require('leap').add_default_mappings()
hi LeapMatch      cterm=underline,nocombine ctermfg=9 gui=underline,nocombine guifg=#a9b665
hi LeapLabelPrimary cterm=nocombine ctermfg=0 ctermbg=9 gui=nocombine guifg=Black guibg=#89b482


autocmd BufReadPost,FileReadPost * normal zR
