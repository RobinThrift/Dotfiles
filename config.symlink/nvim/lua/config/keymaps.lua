vim.g.mapleader = ","

-- switch to last used buffer
vim.keymap.set("n", "<leader>l", "<cmd>b#<CR>", { silent = true, noremap = false })

-- navigate to prev and next buffer
vim.keymap.set("n", "<leader>n", "<cmd>bprevious<CR>", { silent = true, noremap = false })
vim.keymap.set("n", "<leader>m", "<cmd>bnext<CR>", { silent = true, noremap = false })

-- Use ctrl-[hjkl] to select the active split
vim.keymap.set("n", "c-k", "<cmd>wincmd k<CR>", { silent = true, noremap = false })
vim.keymap.set("n", "c-j", "<cmd>wincmd j<CR>", { silent = true, noremap = false })
vim.keymap.set("n", "c-h", "<cmd>wincmd h<CR>", { silent = true, noremap = false })
vim.keymap.set("n", "c-l", "<cmd>wincmd l<CR>", { silent = true, noremap = false })

-- open file under cursor in splits
vim.keymap.set("n", "gfv", "<cmd>vertical wincmd f<CR>", { silent = true, noremap = false })
vim.keymap.set("n", "gfs", "<cmd>wincmd f<CR>", { silent = true, noremap = false })
vim.keymap.set("n", "gfc", "gf", { silent = true, noremap = false })

-- clear hihglight with double escapce
vim.keymap.set('n', '<esc>', '<cmd>noh<cr><esc>', { noremap = true, silent = true })
