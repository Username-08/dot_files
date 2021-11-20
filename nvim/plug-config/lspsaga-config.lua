local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = 'ᐅ',
    warn_sign = 'ᐅ',
    hint_sign = '',
    code_action_prompt = {
        enable = false
    },
    infor_sign = 'ᐅ',
    border_style = "round",
}
