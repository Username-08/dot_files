-- require 'nvim-treesitter.configs'.setup{
--     highlight = {
--         enable = true,
--         disable = {},
--         additional_vim_regex_highlighting = 'false'
--     },
--     incremental_selection = {
--         enable = false,
--     },
--     autopairs = {
--         enable = true,
--     },
--
--     textobjects = {
--       select = {
--         enable = true,
--
--         -- Automatically jump forward to textobj, similar to targets.vim
--         lookahead = true,
--
--         keymaps = {
--           -- You can use the capture groups defined in textobjects.scm
--           ["af"] = "@function.outer",
--           ["if"] = "@function.inner",
--
--           ["ac"] = "@class.outer",
--           ["ic"] = "@class.inner",
--
--           ["al"] = "@loop.outer",
--           ["il"] = "@loop.inner",
--           -- You can optionally set descriptions to the mappings (used in the desc parameter of
--           -- nvim_buf_set_keymap) which plugins like which-key display
--           ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--           -- You can also use captures from other query groups like `locals.scm`
--           ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
--         },
--         -- You can choose the select mode (default is charwise 'v')
--         --
--         -- Can also be a function which gets passed a table with the keys
--         -- * query_string: eg '@function.inner'
--         -- * method: eg 'v' or 'o'
--         -- and should return the mode ('v', 'V', or '<c-v>') or a table
--         -- mapping query_strings to modes.
--         selection_modes = {
--           ['@parameter.outer'] = 'v', -- charwise
--           ['@function.outer'] = 'V', -- linewise
--           ['@class.outer'] = '<c-v>', -- blockwise
--         },
--         -- If you set this to `true` (default is `false`) then any textobject is
--         -- extended to include preceding or succeeding whitespace. Succeeding
--         -- whitespace has priority in order to act similarly to eg the built-in
--         -- `ap`.
--         --
--         -- Can also be a function which gets passed a table with the keys
--         -- * query_string: eg '@function.inner'
--         -- * selection_mode: eg 'v'
--         -- and should return true or false
--         include_surrounding_whitespace = true,
--       },
--
--       move = {
--         enable = true,
--         set_jumps = true, -- whether to set jumps in the jumplist
--         goto_next_start = {
--           ["]m"] = "@function.outer",
--           ["]]"] = { query = "@class.outer", desc = "Next class start" },
--           --
--           -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
--           ["]o"] = "@loop.*",
--           -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
--           ["]p"] = "@parameter.inner",
--           --
--           -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
--           -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
--           ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
--           ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
--         },
--         goto_next_end = {
--           ["]M"] = "@function.outer",
--           ["]["] = "@class.outer",
--         },
--         goto_previous_start = {
--           ["[m"] = "@function.outer",
--           ["[["] = "@class.outer",
--           ["[o"] = "@loop.*",
--           ["[p"] = "@parameter.inner",
--         },
--         goto_previous_end = {
--           ["[M"] = "@function.outer",
--           ["[]"] = "@class.outer",
--         },
--         -- Below will go to either the start or the end, whichever is closer.
--         -- Use if you want more granular movements
--         -- Make it even more gradual by adding multiple queries and regex.
--         goto_next = {
--           ["]d"] = "@conditional.outer",
--         },
--         goto_previous = {
--           ["[d"] = "@conditional.outer",
--         }
--     }
--     },
-- }
-- nvim 0.11

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'lua', 'typescript', 'javascript', 'python', 'java', 'c', 'cpp',
              'go', 'html', 'css', 'json', 'yaml', 'markdown', 'vim', 'qml' },
  callback = function() vim.treesitter.start() end,
})

require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
}

-- keymaps
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "x", "o" }, "am", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "al", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "il", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
end)

-- movement keymaps
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]p", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
end)
-- You can also pass a list to group multiple queries.
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  require("nvim-treesitter-textobjects.move").goto_next_start({"@loop.inner", "@loop.outer"}, "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ "n", "x", "o" }, "]s", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end)
vim.keymap.set({ "n", "x", "o" }, "]z", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[p", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)
