require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
require("copilot_cmp").setup()
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
