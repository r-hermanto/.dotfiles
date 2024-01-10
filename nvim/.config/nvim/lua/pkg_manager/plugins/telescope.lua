local telescope_fzf_native = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
        return vim.fn.executable("make") == 1
    end
}

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        telescope_fzf_native,
    },
    config = function()
        local telescope = require("telescope")
        local telescope_builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                initial_mode = "normal",
                mappings = {
                    n = {
                        ["q"] = require("telescope.actions").close,
                    }
                },
                file_ignore_patterns = { "^%.git/" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                    initial_mode = "insert"
                },
                live_grep = {
                    initial_mode = "insert"
                },
                lsp_dynamic_workspace_symbols = {
                    initial_mode = "insert"
                },
            }
        })
        pcall(require("telescope").load_extension, "fzf")

        vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, {})
        vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, {})
        vim.keymap.set("n", "<leader>gs", telescope_builtin.grep_string, {})
        vim.keymap.set("n", "<leader>sb", telescope_builtin.buffers, {})
        vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, {})
    end
}
