return{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
        view_options = {
          -- Set to true to show dotfiles by default, or false to hide them
          show_hidden = false,

          -- This function defines what is considered a "hidden" file.
          -- You can customize this to hide specific file patterns or names.
          is_hidden_file = function(name, bufnr)

            local is_ignored_extension = vim.endswith(name, ".log") or vim.endswith(name, ".tmp") or vim.endswith(name, ".o") 
            local is_specific_file = name == "node_modules" or name == "build" or name== "../" or name ==".git" or name == ".DS_STORE"

            return  is_ignored_extension or is_specific_file
          end,

          -- This function defines what will *never* be shown, even if `show_hidden` is true.
          -- Use this for directories or files you absolutely want to exclude.
          is_always_hidden = function(name, bufnr)
            -- Example: Always hide the 'vendor' directory
            return name == "vendor"
          end,
          },
    },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
