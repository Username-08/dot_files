let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_graphql = ['prettier']
let g:neoformat_enabled_c = ['clang-format']
let g:neoformat_enabled_rust = ['rustfmt']
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

