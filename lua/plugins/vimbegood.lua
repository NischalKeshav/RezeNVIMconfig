    return {
      "thePrimeagen/vim-be-good",
      cmd = "VimBeGood", -- This ensures the plugin is only loaded when the command is used
      config = function()
        require("VimBeGood").setup {} -- Basic setup, customize as needed
      end,
    }
