-- Execute command: <cmd> ... <CR> || : ... <CR>


-- set the <leader> key to SPACE
vim.g.mapleader = ' '


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- VisualMode move Up and Down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Jump down and center Cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Jump up down and center Cursor
vim.keymap.set("n", "n", "nzzzv") -- Center next word
vim.keymap.set("n", "N", "Nzzzv")


-- Quote selected area
vim.keymap.set("v", "qq", "<Esc>`<i' <Esc> `>a '")
vim.keymap.set("v", "QQ", '<Esc>`<i" <Esc> `>a "')

vim.keymap.set("n", "<leader>m", "`") -- jump to mark a


-- Open directory window (files/folders)
vim.keymap.set("n", "<leader>q", "<cmd> Ex <CR>")

-- ls -l
vim.keymap.set("n", "_ls", ":!ls -l %:S<CR>")


-- Window resizing
vim.keymap.set('n', '<C-j>', '<cmd>res +<cr>', { desc = "Resize window [j] increase"})
vim.keymap.set('n', '<C-k>', '<cmd>res -<cr>', { desc = "Resize window [k] decrease"})
-- vertical
vim.keymap.set('n', '<C-h>', '<C-w><', { desc = "Resize window [h] left"})
vim.keymap.set('n', '<C-l>', '<C-w>>', { desc = "Resize window [l] right"})


