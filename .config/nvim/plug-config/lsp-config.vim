" " LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
 nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" " auto-format
" " autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" " autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" " autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
" " autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
" " autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
" " autocmd BufWritePre *.py FormatWrite
" " autocmd BufWritePre *.ts FormatWrite
" " autocmd BufWritePre *.tsx FormatWrite
" " autocmd BufWritePre *.graphql FormatWrite
" " autocmd BufWritePre *.graphqls FormatWrite
" " " Errors in Red
" " hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
" " " Warnings in Yellow
" " hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
" " " Info and Hints in White
" " hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
" " hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
" " 
" " " Underline the offending code
" " hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
" " hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
" " hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
" " hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline
" 
" lua << EOF
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"  vim.lsp.diagnostic.on_publish_diagnostics, {
"    -- Enable underline, use default values
"    underline = true,
"    -- Enable virtual text only on Warning or above, override spacing to 2
"    virtual_text = {
"      spacing = 2,
"      severity_limit = "Error",
"    },
"  }
" )
" 
" -- vim.diagnostic.config({
" --   virtual_text = {severity=vim.diagnostic.severity.ERROR},
" --   signs = true,
" --   underline = true,
" --   update_in_insert = false,
" --   severity_sort = false,
" -- })
" 
" local signs = { Error = "ᐅ", Warn = "ᐅ", Hint = "", Info = "" }
" for type, icon in pairs(signs) do
"   local hl = "DiagnosticSign" .. type
"   vim.fn.sign_define(hl, { text = icon, texthl = hl })
" end
" 
" local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'clangd' }
" for _, lsp in pairs(servers) do
"   require('lspconfig')[lsp].setup {
"     on_attach = on_attach,
"     flags = {
"       -- This will be the default in neovim 0.7+
"       debounce_text_changes = 150,
"     }
"   }
" end
" EOF
"

lua << EOF 
local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end

local M = {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable underline, use default values
   underline = true,
   -- Enable virtual text only on Warning or above, override spacing to 2
   virtual_text = {
     spacing = 2,
     severity_limit = "Error",
   },
 }
)

local signs = { Error = "ᐅ", Warn = "ᐅ", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl})
end

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
   local opts = _default_opts(options)
   opts.border = "single"
   return opts
end

M.on_attach = function(client, bufnr)
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false
   client.server_capabilities.semanticTokensProvider = nil


   lsp_mappings[1]["mode_opts"] = { buffer = bufnr }

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
   documentationFormat = { "markdown", "plaintext" },
   snippetSupport = true,
   preselectSupport = true,
   insertReplaceSupport = true,
   labelDetailsSupport = true,
   deprecatedSupport = true,
   commitCharactersSupport = true,
   tagSupport = { valueSet = { 1 } },
   resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      },
   },
}

-- lspconfig.sumneko_lua.setup {
--    on_attach = M.on_attach,
--    capabilities = capabilities,
-- 
--    settings = {
--       Lua = {
--          diagnostics = {
--             globals = { "vim", "nvchad" },
--          },
--          workspace = {
--             library = {
--                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
--             },
--             maxPreload = 100000,
--             preloadFileSize = 10000,
--          },
--       },
--    },
-- }

local servers = { 'jedi_language_server', 'rust_analyzer', 'tsserver', 'clangd', 'emmet_ls', 'solidity_ls_nomicfoundation', 'texlab'}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
    }
end

-- solidity ls
-- configs.solidity = {
--   default_config = {
--     cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
--     filetypes = { 'solidity' },
--     root_dir = lspconfig.util.find_git_ancestor,
--     single_file_support = true,
--   },
-- }
-- lspconfig.solidity.setup {}
-- requires a file containing user's lspconfigs

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
 vim.api.nvim_set_hl(0, group, {})
end

return M
