return {
    {
        "numToStr/Comment.nvim",
        config = true,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "sindrets/diffview.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = true,
        event = { "BufReadPre", "BufNewFile" },
    },
}
