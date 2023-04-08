
require('formatter').setup({
  logging = false,
  filetype = {
     graphql = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    typescript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    typescriptreact = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    python = {
        -- prettier
       function()
          return {
            exe = "autopep8",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
  }
})
