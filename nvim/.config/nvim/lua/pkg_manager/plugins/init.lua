return {
    { "numToStr/Comment.nvim",  config = true },
    { "sindrets/diffview.nvim" },
    { "lukas-reineke/indent-blankline.nvim",    main = "ibl",       config = true },
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
