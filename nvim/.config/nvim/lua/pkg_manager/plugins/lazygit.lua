return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {})

        -- playing nice with builtin terminal
        vim.keymap.set('t', '<Esc>', function()
            local current_bufnr = vim.fn.bufnr('%')
            local filetype = vim.api.nvim_buf_get_option(current_bufnr, 'filetype')
            return (filetype and filetype ~= 'lazygit') and '<C-\\><C-N>' or '<Esc>'
        end, { silent = true, expr = true })
    end
}
