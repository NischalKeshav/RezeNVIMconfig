return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        -- Core languages
        "lua",
        "vim",
        "vimdoc",
        "query",

        -- Web languages
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "svelte",

        -- Other languages matching your LSP setup
        "python",
        "c",
        "cpp",
        "zig",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = { "python" }, -- tree-sitter indentation is bad for Python
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
    })
  end,
}

