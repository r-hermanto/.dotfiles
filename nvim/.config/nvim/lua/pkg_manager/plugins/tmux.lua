return {
    "numToStr/Navigator.nvim",
    config = true,
    keymaps = {
        vim.keymap.set({ 'n', 't' }, '<M-h>', '<CMD>NavigatorLeft<CR>'),
        vim.keymap.set({ 'n', 't' }, '<M-l>', '<CMD>NavigatorRight<CR>'),
        vim.keymap.set({ 'n', 't' }, '<M-k>', '<CMD>NavigatorUp<CR>'),
        vim.keymap.set({ 'n', 't' }, '<M-j>', '<CMD>NavigatorDown<CR>'),
        vim.keymap.set({ 'n', 't' }, '<M-p>', '<CMD>NavigatorPrevious<CR>'),
    }
}
