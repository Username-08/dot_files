let g:neoformat_cpp_clang_format = {
            \ 'exe': 'clang-format',
            \ 'args': ['--style="{BasedOnStyle: llvm, IndentWidth: 4}"']
            \ }
let g:neoformat_c_clang_format = {
            \ 'exe': 'clang-format',
            \ 'args': ['--style="{BasedOnStyle: llvm, IndentWidth: 4}"']
            \ }
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_graphql = ['prettier']
let g:neoformat_enabled_c = ['clang_format']
let g:neoformat_enabled_C = ['clang_format']
let g:neoformat_enabled_cpp = ['clang_format']
let g:neoformat_enabled_rust = ['rustfmt']
augroup fmt
  autocmd!
  " autocmd BufWritePre * undojoin | Neoformat
  autocmd BufWritePre * | Neoformat
augroup END

