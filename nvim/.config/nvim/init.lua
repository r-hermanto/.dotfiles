require("core")
require("pkg_manager")

require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'go', 'python' },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<M-space>",
        }
    }
})

require('dapui').setup()

local dap = require('dap')
local dapui = require('dapui')

vim.keymap.set('n', '<leader>ds', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>bp', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
        },
    },
}

require('dap-go').setup()

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

require('Navigator').setup()
vim.keymap.set({ 'n', 't' }, '<M-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<M-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<M-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<M-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({ 'n', 't' }, '<M-p>', '<CMD>NavigatorPrevious<CR>')
