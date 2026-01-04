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
            "rebelot/kanagawa.nvim",
            lazy = false,
            priority = 1,
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
        {'tronikelis/ts-autotag.nvim'}
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd("colorscheme kanagawa-dragon")

require('lualine').setup{
    options = { theme = 'kanagawa' }
}

require('nvim-treesitter').setup({
    highlight = { enable = true },
    indent = { enable = true },
})
require('nvim-treesitter').install {'javascript', 'lua', 'typescript', 'css'}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
