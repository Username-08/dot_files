nnoremap <silent> <space>e :Telescope file_browser<CR>
nnoremap <silent> <space>f :Telescope buffers<CR>
nnoremap <silent> <space>p :Telescope find_files<CR>

lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
    extensions = {
        file_browser = {
            respect_gitignore = false,

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
        undo = {};
      },
    defaults = {
        file_ignore_patterns={"node_modules/.", "dist/.", "target/."},
        prompt_prefix = "  " .. "" .. "  ",
        selection_caret = " ❯ ",
        entry_prefix = "   ",
    },
    pickers = {
        find_files = {
            find_command = {"fd", "--type", "f", "--no-ignore-vcs"}
        },
    }
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension("undo")
EOF
