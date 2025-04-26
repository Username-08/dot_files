require('orgmode').setup({
  org_agenda_files = '~/Documents/Org/orgfiles/**/*',
  org_default_notes_file = '~/Documents/orgfiles/refile.org',
})

require('org-roam').setup({
  directory = '~/Documents/Org/roam',
})
