return {
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false }
    },
}
