return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require('nvim-autopairs')
	    
    npairs.setup({
      check_ts = true, -- Enable treesitter integration
      ts_config = {
        lua = { 'string' }, -- Don't add pairs in lua string treesitter nodes
        javascript = { 'template_string' },
        java = false, -- Don't check treesitter on java
      },
      disable_filetype = { "TelescopePrompt", "vim" },
      fast_wrap = {
        map = '<M-e>', -- Alt+e to fast wrap
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = ',',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    })
    
    -- Optional: Add rules for specific languages
    local Rule = require('nvim-autopairs.rule')
    
    -- Add spaces between parentheses
    npairs.add_rules({
      Rule(' ', ' ')
        :with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({ '()', '[]', '{}' }, pair)
        end),
      Rule('( ', ' )')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
      Rule('{ ', ' }')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
      Rule('[ ', ' ]')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']')
    })
  end,
}
