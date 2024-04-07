return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "folke/neodev.nvim", opts = {} },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local on_attach = function(_, bufnr)
            local telescope_builtin = require("telescope.builtin")
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<space>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
            vim.keymap.set("n", "<leader>sc", telescope_builtin.quickfix, opts)
            vim.keymap.set("n", "<leader>ss", telescope_builtin.lsp_dynamic_workspace_symbols, opts)

            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end

        local servers = {
            gopls = {},
            pyright = {},
            ruff_lsp = {},
            lua_ls = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                }
            }
        }

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers)
        })

        mason_lspconfig.setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    settings = servers[server_name],
                    on_attach = on_attach,
                })
            end
        }
    end
}
