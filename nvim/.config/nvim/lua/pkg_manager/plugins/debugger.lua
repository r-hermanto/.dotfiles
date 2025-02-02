return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "igorlfs/nvim-dap-view", opts = {} },
        { "leoluz/nvim-dap-go" },
    },
    config = function()
        local dap = require("dap")
        require("dap-go").setup()

        vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dbc", function()
            dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end, { desc = "Debug: Set Breakpoint" })
    end
}
-- return {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--         "rcarriga/nvim-dap-ui",
--         "williamboman/mason.nvim",
--         "leoluz/nvim-dap-go",
--     },
--     event = { "BufReadPre", "BufNewFile" },
--     config = function()
--         local dap = require("dap")
--         local dapui = require("dapui")
--
--         -- Dap UI setup
--         -- For more information, see |:help nvim-dap-ui|
--         dapui.setup {
--             -- Set icons to characters that are more likely to work in every terminal.
--             --    Feel free to remove or use ones that you like more! :)
--             --    Don"t feel like these are good choices.
--             icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
--             controls = {
--                 icons = {
--                     pause = "⏸",
--                     play = "▶",
--                     step_into = "⏎",
--                     step_over = "⏭",
--                     step_out = "⏮",
--                     step_back = "b",
--                     run_last = "▶▶",
--                     terminate = "⏹",
--                     disconnect = "⏏",
--                 },
--             },
--         }
--
--         require("dap-go").setup()
--
--         dap.listeners.after.event_initialized["dapui_config"] = dapui.open
--         dap.listeners.before.event_terminated["dapui_config"] = dapui.close
--         dap.listeners.before.event_exited["dapui_config"] = dapui.close
--
--         vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug: Start/Continue" })
--         vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
--         vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Debug: Step Over" })
--         vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
--         vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
--         vim.keymap.set("n", "<leader>B", function()
--             dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
--         end, { desc = "Debug: Set Breakpoint" })
--     end
-- }
