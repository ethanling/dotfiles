-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.expandtab = true 
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.showmatch = true
vim.opt.termguicolors = true

vim.keymap.set('n', '<leader><leader>', 'V', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal<CR>', { silent = true })
-- Pane Navigation
vim.keymap.set('n', '<leader>h', '<C-w>h', { silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { silent = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { silent = true })

vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "Go to bottom and center" })


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
    -- add your plugins here
        {
            "sainnhe/gruvbox-material",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme('gruvbox-material')
            end
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
              "nvim-lua/plenary.nvim",
              "MunifTanjim/nui.nvim",
              "nvim-tree/nvim-web-devicons", -- optional, but recommended
            },
            lazy = false, -- neo-tree will lazily load itself
        },
        {
	        "xiyaowong/transparent.nvim",
            lazy = false,
            priority = 1000,
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
        },
        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            build = ':TSUpdate'
        },
        {
            'nvim-telescope/telescope.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                -- optional but recommended
                { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            }
        },
        {'tronikelis/ts-autotag.nvim'},
        -- LSP and Completion
        {'williamboman/mason.nvim', config = true},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'L3MON4D3/LuaSnip'},
        {'saadparwaiz1/cmp_luasnip'},
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "gruvbox-material" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require('lualine').setup{
    options = { theme = 'gruvbox' }
}

require('nvim-treesitter').setup({
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = false,
    ensure_installed = {'javascript', 'lua', 'typescript', 'css'}
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Setup nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
})

-- Setup Mason and LSP servers
require('mason-lspconfig').setup({
    ensure_installed = { 'ts_ls' },
    automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup TypeScript LSP (Neovim 0.11+ API)
vim.lsp.config['ts_ls'] = {
    capabilities = capabilities,
}
vim.lsp.enable('ts_ls')

-- Bun configuration
-- Run current file with Bun
vim.keymap.set('n', '<leader>br', function()
    local file = vim.fn.expand('%:p')
    vim.cmd('split | terminal bun ' .. file)
end, { desc = 'Run current file with Bun' })

-- Run bun install in current directory
vim.keymap.set('n', '<leader>bi', function()
    vim.cmd('split | terminal bun install')
end, { desc = 'Bun install' })

-- Run bun dev in current directory
vim.keymap.set('n', '<leader>bd', function()
    vim.cmd('split | terminal bun dev')
end, { desc = 'Bun dev' })

-- Set Bun as the Node.js runtime for Neovim's built-in terminal
vim.env.PATH = vim.fn.expand('~/.bun/bin') .. ';' .. vim.env.PATH
