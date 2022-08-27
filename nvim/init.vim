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
    

call plug#begin('~/.vim/plugged')

Plug 'andweeb/presence.nvim'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'sainnhe/everforest'
Plug 'rafamadriz/friendly-snippets'
" Plug 'lervag/vimtex'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'alvan/vim-closetag'
Plug 'sainnhe/gruvbox-material'
Plug 'chrisbra/Colorizer'
Plug 'puremourning/vimspector'
" Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim'
"
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
Plug 'glepnir/lspsaga.nvim'
" Plug 'tami5/lspsaga.nvim'
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

" let g:everforest_background='hard'
" let g:everforest_enable_italic = 1
" let g:everforest_better_performance = 1
" let g:everforest_transparent_background = 1
" colorscheme everforest


set splitbelow
set switchbuf=newtab
nnoremap \\ :botright spl<CR>:term<CR>:resize 15<CR>
" source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/telescope-config.rc.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim
source $HOME/.config/nvim/plug-config/neoformat.rc.vim
luafile $HOME/.config/nvim/plug-config/treesitter-config.lua
" luafile $HOME/.config/nvim/plug-config/compe-config.lua
luafile $HOME/.config/nvim/plug-config/luasnip-config.lua
luafile $HOME/.config/nvim/plug-config/nvim-cmp.lua
" luafile $HOME/.config/nvim/plug-config/python-config.lua
" luafile $HOME/.config/nvim/plug-config/latex-config.lua
" luafile $HOME/.config/nvim/plug-config/javascript-config.lua
" luafile $HOME/.config/nvim/plug-config/cpp-config.lua
luafile $HOME/.config/nvim/plug-config/lualine-config.lua
luafile $HOME/.config/nvim/plug-config/lspsaga-config.lua
luafile $HOME/.config/nvim/plug-config/autopair-config.lua
luafile $HOME/.config/nvim/plug-config/comment-config.lua
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
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" remap for closing buffer
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>ca :Lspsaga code_action<CR>
nnoremap <leader>cra :Lspsaga range_code_action<CR>
nnoremap <leader>rn :Lspsaga rename<CR>

hi DiagnosticWarn guifg=#d8a657
hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineHint gui=undercurl
hi DiagnosticUnderlineWarn gui=undercurl
hi CursorLine guibg=None

highlight! CmpPmenuBorder guifg=#7c6f64 guibg=#32302f
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


function Set_outline()
    sleep 50m
    hi LSOutlineKey           guifg=#ea6962
    hi LSOutlineEnum  guifg=#d8a657        
    hi LSOutlineFile         guifg=#a9b665 
    hi LSOutlineNull          guifg=#e78a4e
    hi LSOutlineArray         guifg=#7daea3
    hi LSOutlineClass        guifg=#d8a657 
    hi LSOutlineEvent         guifg=#7daea3
    hi LSOutlineField         guifg=#89b482
    hi LSOutlineMacro        guifg=#e78a4e 
    hi LSOutlineMethod        guifg=#89b482
    hi LSOutlineModule       guifg=#d8a657 
    hi LSOutlineNumber        guifg=#e78a4e
    hi LSOutlineObject       guifg=#d8a657 
    hi LSOutlineString        guifg=#a9b665
    hi LSOutlineStruct       guifg=#d8a657 
    hi LSOutlineBoolean       guifg=#e78a4e
    hi LSOutlinePackage       guifg=#e78a4e
    hi LSOutlineConstant      guifg=#d8a657  
    hi LSOutlineFunction     guifg=#7daea3 
    hi LSOutlineOperator      guifg=#e78a4e
    hi LSOutlineProperty      guifg=#89b482
    hi LSOutlineVariable     guifg=#ea6962 
    hi LSOutlineInterface    guifg=#d8a657 
    hi LSOutlineNamespace    guifg=#d8a657 
    hi LSOutlineParameter     guifg=#89b482
    hi LSOutlineTypeAlias     guifg=#d8a657
    hi LSOutlineEnumMember   guifg=#d8a657 
    hi LSOutlineConstructor   guifg=#89b482
    hi LSOutlineStaticMethod  guifg=#89b482
    hi LSOutlinePreviewBorder guifg=#7c6f64
    hi LSOutlineTypeParameter  guifg=#89b482
endfunction

nnoremap  <leader>ot :LSoutlineToggle<CR>:call Set_outline()<CR>
