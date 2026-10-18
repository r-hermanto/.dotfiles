local opt = vim.opt

vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

opt.signcolumn = "number"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.cursorline = true
-- opt.colorcolumn = "120"

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = -1
opt.smartindent = true

opt.updatetime = 250
opt.timeoutlen = 500

opt.undofile = true

-- vim.opt.showmode = true


vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x" }, "<leader>Y", '"+y$', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "[b", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })

vim.keymap.set("n", "[c", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "]c", ":cnext<CR>", { silent = true })

vim.keymap.set("n", "<M-j>", ":m .+1<CR>", { silent = true})
vim.keymap.set("n", "<M-k>", ":m .-2<CR>", { silent = true})

vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { silent = true })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ timeout = 150 })
    end,
    group = highlight_group,
    pattern = "*",
})
