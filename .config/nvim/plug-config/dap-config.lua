require("dapui").setup()

vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require(\"dapui\").toggle()<CR>", {noremap = true})
