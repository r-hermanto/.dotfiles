vim.pack.add({'https://github.com/ibhagwan/fzf-lua'})

local fzf = require("fzf-lua")
fzf.setup({})

vim.keymap.set("n", "<leader>sf", fzf.files, {})
vim.keymap.set("n", "<leader>sg", fzf.live_grep, {})
