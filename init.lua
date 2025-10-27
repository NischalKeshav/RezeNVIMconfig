-- Set leader key to spacebar (MUST be before any keymaps)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Background directory configuration
local bg_dir = vim.fn.expand('~/.config/nvim/backgrounds')

vim.wo.number = true
-- ============================================
-- BUFFER MANAGEMENT FUNCTIONS
-- ============================================

-- Function to create a new buffer
local function new_buffer()
  vim.cmd('enew')
  print("New buffer created")
end

-- Function to close current buffer
local function close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  
  -- Check if buffer is modified
  if vim.bo[bufnr].modified then
    local choice = vim.fn.confirm(
      "Buffer has unsaved changes. Save before closing?",
      "&Yes\n&No\n&Cancel",
      3
    )
    if choice == 1 then
      vim.cmd('write')
    elseif choice == 3 then
      return
    end
  end
  
  -- Find another buffer to switch to
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  if #buffers > 1 then
    vim.cmd('bprevious')
  end
  
  vim.cmd('bdelete ' .. bufnr)
  print("Buffer closed: " .. (bufname ~= "" and vim.fn.fnamemodify(bufname, ':t') or "[No Name]"))
end

-- Function to list all buffers
local function list_buffers()
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  if #buffers == 0 then
    print("No buffers open")
    return
  end
  
  print("Open buffers:")
  for i, buf in ipairs(buffers) do
    local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ':t') or "[No Name]"
    local modified = buf.changed == 1 and " [+]" or ""
    local current = buf.bufnr == vim.api.nvim_get_current_buf() and " *" or ""
    print(string.format("%d. %s%s%s", i, name, modified, current))
  end
end

-- Function to switch to buffer by number
local function switch_buffer()
  list_buffers()
  local choice = vim.fn.input("Enter buffer number: ")
  local idx = tonumber(choice)
  
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  if idx and idx > 0 and idx <= #buffers then
    vim.api.nvim_set_current_buf(buffers[idx].bufnr)
    print("Switched to buffer: " .. vim.fn.bufname(buffers[idx].bufnr))
  else
    print("Invalid buffer number")
  end
end

-- Function to go to next buffer
local function next_buffer()
  vim.cmd('bnext')
end

-- Function to go to previous buffer
local function prev_buffer()
  vim.cmd('bprevious')
end

-- ============================================
-- COMMANDS
-- ============================================

-- Background commands

-- Buffer commands
vim.api.nvim_create_user_command('BufNew', new_buffer, {})
vim.api.nvim_create_user_command('BufClose', close_buffer, {})
vim.api.nvim_create_user_command('BufList', list_buffers, {})
vim.api.nvim_create_user_command('BufSwitch', switch_buffer, {})

-- ============================================
-- KEYBINDINGS
-- ============================================


-- Buffer keybindings
vim.keymap.set('n', '<leader>bn', new_buffer, { desc = 'New buffer' })
vim.keymap.set('n', '<leader>bc', close_buffer, { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bl', list_buffers, { desc = 'List buffers' })
vim.keymap.set('n', '<leader>bb', switch_buffer, { desc = 'Switch buffer' })
vim.keymap.set('n', '<Tab>', next_buffer, { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', prev_buffer, { desc = 'Previous buffer' })

-- Split keybindings
vim.keymap.set('n', '<leader>bv', ':vsplit<CR>', { desc = 'Split buffer right' })
vim.keymap.set('n', '<leader>bh', ':split<CR>', { desc = 'Split buffer below' })
vim.keymap.set('n', '<leader>bx', ':close<CR>', { desc = 'Close split' })

-- Basic keybindings
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })

-- ============================================
-- TRANSPARENCY CONFIGURATION
-- ============================================

-- Clear Neovim background for transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- Clear more highlight groups for full transparency
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "SpecialKey", { bg = "none" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })


--added features
--
-- vim-plug setup
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Add your plugins here
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/tokyonight.nvim'



vim.keymap.set('n', '<leader><leader>', ':Telescope find_files <CR>', {desc= 'Find files via telescope'})



-- Add more plugins as needed

vim.call('plug#end')
vim.wo.relativenumber = true

print("✓ Background & Buffer config loaded!")
print("Keybinds: <Space>bn=new | <Space>bv=vsplit | Tab=next | <Space>bc=close")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
