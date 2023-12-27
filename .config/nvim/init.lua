vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.scrolloff = 20
opt.wrap = false
opt.signcolumn = 'yes'

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.timeoutlen = 500
opt.completeopt = 'menu,menuone,noselect,preview'

opt.termguicolors = true
opt.clipboard = 'unnamedplus'
opt.undofile = true

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })

vim.keymap.set('t', '<Esc>', function()
    local current_bufnr = vim.fn.bufnr('%')
    local filetype = vim.api.nvim_buf_get_option(current_bufnr, 'filetype')
    if filetype and filetype ~= 'lazygit' then
        return "<C-\\><C-N>"
    end
end

, { silent = true, expr = true })

vim.keymap.set('n', '<M-a>', '<C-^>', { silent = true })
vim.keymap.set('n', '[b', ':bprev<CR>', { silent = true })
vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true })

vim.keymap.set('n', '[q', ':cprev<CR>', { silent = true })
vim.keymap.set('n', ']q', ':cnext<CR>', { silent = true })

vim.keymap.set('n', '<M-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<M-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<M-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<M-k>', '<C-w>k', { silent = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
    group = highlight_group,
    pattern = '*',
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = { style = 'night' }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp'
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable('make') == 1
        end
    },
    {
        { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'numToStr/Comment.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    { 'lukas-reineke/indent-blankline.nvim' },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'williamboman/mason.nvim',
            'leoluz/nvim-dap-go',
        }
    },
    { 'numToStr/Navigator.nvim' }
})

vim.cmd.colorscheme('tokyonight')


local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm {
            select = true
        }
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }
})


require('telescope').setup({
    defaults = {
        initial_mode = 'normal',
        mappings = {
            n = {
                ['q'] = require('telescope.actions').close,
            }
        },
        file_ignore_patterns = { ".git/" },
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
            initial_mode = 'insert'
        },
        live_grep = {
            initial_mode = 'insert'
        },
        lsp_dynamic_workspace_symbols = {
            initial_mode = 'insert'
        },
    }
})
pcall(require('telescope').load_extension, 'fzf')

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>gs', telescope_builtin.grep_string, {})
vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, {})

local servers = {
    gopls = {},
    pyright = {},
    lua_ls = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
        }
    }
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers)
})

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
        })
    end
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', '<leader>sc', telescope_builtin.quickfix, opts)
        vim.keymap.set('n', '<leader>ss', telescope_builtin.lsp_dynamic_workspace_symbols, opts)
    end,
})

require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'go', 'python' },
    highlist = {
        enable = true,
    }
})

require('Comment').setup()

require('gitsigns').setup()

require('ibl').setup()

require('dapui').setup()

local dap = require('dap')
local dapui = require('dapui')

vim.keymap.set('n', '<leader>ds', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
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

vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {})

require('Navigator').setup()
vim.keymap.set({ 'n', 't' }, '<M-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<M-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<M-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<M-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({ 'n', 't' }, '<M-p>', '<CMD>NavigatorPrevious<CR>')
