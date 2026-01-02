return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({})

        local suggestion = require("copilot.suggestion")
        vim.keymap.set("n", "<space>ga", suggestion.toggle_auto_trigger, {})
    end,
}
