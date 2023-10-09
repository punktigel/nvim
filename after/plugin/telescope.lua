local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles"}) -- files in dir
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = "Current buffer [F]u[Z]zy find"})

-- History
vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = "[C]ommand [H]istory"})
vim.keymap.set('n', '<leader>sh', builtin.search_history, { desc = "[S]earch [H]istory"})

-- Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "[G]it [B]ranches"})
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "[G]it [F]iles"})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "[G]it [C]ommits"})
vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = "[G]it [C]ommits on this branch"})
vim.keymap.set('n', '<leader>gi', builtin.git_status, { desc = "[G]it status ([I]nfo)"})
vim.keymap.set('n', '<leader>gsh', builtin.git_stash, { desc = "[G]it [S]tas[H]"})


vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "[F]ind [S]tring"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep"})

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]iles in the [B]uffer"}) -- files in buffer
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp tags"})

vim.keymap.set('n', '<leader>hg', builtin.highlights, { desc = "[H]ighlight [G]roups"}) -- get highlight groups
vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = "[K]eymaps"}) -- get all keymaps
