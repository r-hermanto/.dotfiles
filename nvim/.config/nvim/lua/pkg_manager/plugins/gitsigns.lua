return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            current_line_blame_opts = {
                delay = 0
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "<leader>bl", gs.blame_line, opts)
            end
        })
    end
}
