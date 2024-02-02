return {
    {
        "numToStr/Comment.nvim",
        config = true,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        event = { "BufReadPre", "BufNewFile" },
    },
}
