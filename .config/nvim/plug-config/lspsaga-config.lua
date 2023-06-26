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
        frequency = 15,
    },
})
