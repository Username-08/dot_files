nnoremap <silent> <space>e <Cmd>Telescope file_browser<CR>
nnoremap <silent> <space>f <Cmd>Telescope buffers<CR>
nnoremap <silent> <space>r <Cmd>Telescope find_files<CR>

lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
extensions = {
    file_browser = {
      -- theme = "",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
defaults = {
    file_ignore_patterns={"node_modules/.", "dist/.", "target/."},
    mappings = {
        n = {
            ["q"] = actions.close
            }
        }
    },
}

require("telescope").load_extension "file_browser"
EOF
