-- -- Setup nvim-cmp.
-- local cmp = require'cmp'
-- 
-- cmp.setup({
--     -- snippet = {
--     --   -- REQUIRED - you must specify a snippet engine
--     --   expand = function(args)
--     --     -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--     --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--     --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--     --     -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
--     --   end,
--     -- },
--     formatting = {
--         format = function(entry, vim_item)
--             vim_item.menu = ({
--                 nvim_lsp = "[LSP]",
--                 look = "[Dict]",
--                 buffer = "[Buffer]",
--             })[entry.source.name]
--             return vim_item
--         end
--     },
--     mapping = {
--       ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--       ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--       ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--       ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--       ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--       ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--       ['<C-e>'] = cmp.mapping({
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--       }),
--       ['<Space>'] = cmp.mapping.confirm({ select = false }),
--     },
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       -- { name = 'vsnip' }, -- For vsnip users.
--       -- { name = 'luasnip' }, -- For luasnip users.
--       -- { name = 'ultisnips' }, -- For ultisnips users.
--       -- { name = 'snippy' }, -- For snippy users.
--     }, {
--       { name = 'buffer' },
--     })
--   })
-- 
--   -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--   -- cmp.setup.cmdline('/', {
--   --   sources = {
--   --     { name = 'buffer' }
--   --   }
--   -- })
-- 
--   -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   -- cmp.setup.cmdline(':', {
--   --   sources = cmp.config.sources({
--   --     { name = 'path' }
--   --   }, {
--   --     { name = 'cmdline' }
--   --   })
--   -- })
-- 
--   -- Setup lspconfig.
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--   -- require('lspconfig')['rust_analyzer'].setup {
--   --   capabilities = capabilities
--   -- }
--   -- require('lspconfig')['pyright'].setup {
--   --   capabilities = capabilities
--   -- }
--
-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
-- 
-- local luasnip = require("luasnip")
local cmp = require'cmp'

  cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                look = "[Dict]",
                buffer = "[Buffer]",
            })[entry.source.name]
            return vim_item
        end
    },
    snippet = {
    --  -- REQUIRED - you must specify a snippet engine
      expand = function(args)
    --    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<Space>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
