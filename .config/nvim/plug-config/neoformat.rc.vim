" let g:neoformat_cpp_clang_format = {
"             \ 'exe': 'clang-format',
"             \ 'args': ['--style="{BasedOnStyle: llvm, IndentWidth: 4}"']
"             \ }
" let g:neoformat_c_clang_format = {
"             \ 'exe': 'clang-format',
"             \ 'args': ['-style=file'],
"             \ }

let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_graphql = ['prettier']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_C = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_rust = ['rustfmt']
" augroup fmt
"   autocmd!
"   " autocmd BufWritePre * undojoin | Neoformat
"   autocmd BufWritePre * | Neoformat
" augroup END

