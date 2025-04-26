local saga = require 'lspsaga'

-- change the lsp symbol kind
-- local kind = require('lspsaga.lspkind')
-- kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

-- use custom config
-- saga.init_lsp_saga({
--     -- put modified options in there
--     border_style = "rounded",
--     -- show_diagnostic_source = false,
--     code_action_icon = "",
--     code_action_lightbulb = {
--         enable = true,
--         sign = false,
--         enable_in_insert = true,
--         sign_priority = 20,
--         virtual_text = true,
--     },
-- })
saga.setup({
    lightbulb = {
        enable = false,
    },
    symbol_in_winbar = {
        enable = false,
        color_mode = true,
        separator = "  ",
        show_file = true,
    },
    ui = {
        border = "rounded",
    },
    beacon = {
        frequency = 10,
    },
})

vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', { silent = true })
vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>', { silent = true })
vim.keymap.set('n', '<Leader>ot', '<cmd>Lspsaga outline<cr>', { silent = true })
vim.keymap.set('n', '<leader>ob', '<cmd>Lspsaga winbar_toggle<cr>', { silent = true })

vim.keymap.set('n', '<C-n>', '<cmd>Lspsaga diagnostic_jump_next<cr>', { silent = true })
vim.keymap.set('n', '<C-p>', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { silent = true })
