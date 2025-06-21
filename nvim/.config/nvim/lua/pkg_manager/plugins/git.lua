return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                current_line_blame_opts = {
                    delay = 0
                },
                preview_config = {
                    border = "rounded",
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local opts = { buffer = bufnr }
                    vim.keymap.set("n", "<leader>bl", gs.blame_line, opts)
                    vim.keymap.set("n", "]g", gs.next_hunk, opts)
                    vim.keymap.set("n", "[g", gs.prev_hunk, opts)
                end
            })
        end
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})

            -- playing nice with builtin terminal
            vim.keymap.set("t", "<Esc>", function()
                local current_bufnr = vim.fn.bufnr("%")
                local filetype = vim.api.nvim_buf_get_option(current_bufnr, "filetype")
                return (filetype and filetype ~= "lazygit") and "<C-\\><C-N>" or "<Esc>"
            end, { silent = true, expr = true })
        end

    },
    {
        "sindrets/diffview.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
}
