return{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local autopairs = require('nvim-autopairs')
    autopairs.setup({})
    
    -- blink.cmp integration
    local blink_ok, blink = pcall(require, 'blink.cmp')
    if blink_ok then
      blink.on_confirm_done = function()
        local autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
        if autopairs_ok then
          cmp_autopairs.on_confirm_done()
        end
      end
    end
  end,
}
