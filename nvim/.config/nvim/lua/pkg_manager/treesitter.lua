vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter'})

local treesitter = require('nvim-treesitter')
treesitter.install { "lua", "go", "vim", "vimdoc", "query", "bash", "markdown", "markdown_inline", "json" }
