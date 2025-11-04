-- init.lua with lazy.nvim package manager
-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before lazy setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugin specifications
require("lazy").setup({
  -- Dependencies
  { import = "plugins" },
  'nvim-lua/plenary.nvim',
  


  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  
  -- Theme
 {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        variant = 'main', -- 'main', 'moon', or 'dawn' (light)
        dark_variant = 'main',
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      })
      
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
      if not status_ok then
        return
      end
      
      configs.setup({
        ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "markdown",
        "bash"
	},
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
})

-- Options
vim.wo.relativenumber = true
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- Keymaps
vim.keymap.set('n', '<leader><leader>', ':Telescope find_files<CR>', {desc = 'Find files via telescope'})
vim.keymap.set('n', '<leader>pv',vim.cmd.Ex, {desc= 'Switch to file searcer'})


vim.opt.signcolumn = "yes"
vim.opt.swapfile = true
vim.opt.directory = vim.fn.stdpath("data") .. "/swap//"
vim.opt.updatecount = 100

vim.opt.swapfile = true;

