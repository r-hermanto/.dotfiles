vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set("n", "<M-a>", "<C-^>", { silent = true })

vim.keymap.set("n", "[b", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })

vim.keymap.set("n", "[c", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "]c", ":cnext<CR>", { silent = true })

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux_sessionizer<CR>")
