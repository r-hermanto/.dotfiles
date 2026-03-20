return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("markview").setup({
            preview = {
                enable = false,
            }
        })

        vim.keymap.set("n", "<leader>mp", ":Markview splitToggle<CR>")
    end
}
