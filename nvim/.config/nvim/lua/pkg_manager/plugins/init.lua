return {
    { "numToStr/Comment.nvim",  config = true },
    { "sindrets/diffview.nvim" },
    { "lukas-reineke/indent-blankline.nvim",    main = "ibl",       config = true },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "leoluz/nvim-dap-go",
        }
    },
}
