local neogit = require('neogit')
neogit.setup {
  integrations = {
    telescope = true,
    diffview = true,
  },
  graph_style = 'kitty',
}
