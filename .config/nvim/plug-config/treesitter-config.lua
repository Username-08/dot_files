require 'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = 'false'
    },
    incremental_selection = {
        enable = false,
    },
    autopairs = {
        enable = true,
    }
}
