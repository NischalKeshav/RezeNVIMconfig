return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
sources = {
  providers = {
    snippets = {
      opts = {
        friendly_snippets = true, -- default

        -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
        -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
        -- the following is just an example, you should only enable the frameworks that you use
        extended_filetypes = {
          markdown = { 'jekyll' },
          sh = { 'shelldoc' },
          php = { 'phpdoc' },
          cpp = { 'unreal' }
        }
      }
    }
  }
},
  opts_extend = { "sources.default" }
}
