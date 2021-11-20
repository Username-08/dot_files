nnoremap <silent> <space>e <Cmd>Telescope file_browser<CR>
nnoremap <silent> <space>f <Cmd>Telescope buffers<CR>
nnoremap <silent> <space>r <Cmd>Telescope find_files<CR>

lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
defaults = {
    file_ignore_patterns={"node_modules/.", "dist/.", "target/."},
    mappings = {
        n = {
            ["q"] = actions.close
            }
        }
    },
}
EOF
