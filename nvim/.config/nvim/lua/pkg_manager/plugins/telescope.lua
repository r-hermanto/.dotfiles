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
    }
}
