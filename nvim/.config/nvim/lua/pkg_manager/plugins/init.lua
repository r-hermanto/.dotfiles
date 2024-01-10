return {
    { "numToStr/Comment.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim" },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { "lukas-reineke/indent-blankline.nvim" },
    { "nvim-treesitter/nvim-treesitter",        build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "leoluz/nvim-dap-go",
        }
    },
    { "numToStr/Navigator.nvim" },
}
