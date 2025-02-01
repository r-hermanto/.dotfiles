return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "n",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
        },
        format_after_save = {
            lsp_format = "fallback",
        },
    },
}
