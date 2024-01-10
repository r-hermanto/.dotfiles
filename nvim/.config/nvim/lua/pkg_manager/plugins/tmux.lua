return {
    "numToStr/Navigator.nvim",
    config = true,
    keymaps = {
        vim.keymap.set({ "n", "t" }, "<M-h>", ":NavigatorLeft<CR>"),
        vim.keymap.set({ "n", "t" }, "<M-l>", ":NavigatorRight<CR>"),
        vim.keymap.set({ "n", "t" }, "<M-k>", ":NavigatorUp<CR>"),
        vim.keymap.set({ "n", "t" }, "<M-j>", ":NavigatorDown<CR>"),
        vim.keymap.set({ "n", "t" }, "<M-p>", ":NavigatorPrevious<CR>"),
    }
}
