return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- Your gitsigns configuration options go here
    -- For example:
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = 'X' },
      topdelete = { text = 'X' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    signs_staged = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = 'X' },
      topdelete = { text = 'X' },
      changedelete = { text = '▎' },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
      end

      -- Keymaps for gitsigns actions
      map('n', ']c', function()
        if vim.wo.diff then return end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, 'Next Hunk')

      map('n', '[c', function()
        if vim.wo.diff then return end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, 'Prev Hunk')

      map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
      map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
      map('n', '<leader>hS', gs.stage_buffer, 'Stage Buffer')
      map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo Stage Hunk')
      map('n', '<leader>hR', gs.reset_buffer, 'Reset Buffer')
      map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
      map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame Line')
      map('n', '<leader>tb', gs.toggle_current_line_blame, 'Toggle Line Blame')
      map('n', '<leader>hd', gs.diffthis, 'Diff This')
      map('n', '<leader>hD', function() gs.diffthis('~') end, 'Diff This ~')
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select Hunk')
    end,
  },
}
