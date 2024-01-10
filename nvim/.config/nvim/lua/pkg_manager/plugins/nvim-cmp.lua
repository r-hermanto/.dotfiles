return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            -- snippet = {
            --     expand = function(args)
            --         require("luasnip").lsp_expand(args.body)
            --     end
            -- },
            mapping = cmp.mapping.preset.insert {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping.complete {},
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm {
                    select = true
                }
            },
            sources = {
                { name = "nvim_lsp" },
                -- { name = "luasnip" },
                { name = "nvim_lsp_signature_help" }
            }
        })
    end
}
