return {
  'neovim/nvim-lspconfig',
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    
    -- Lua LSP
    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      cmd = { 'lua-language-server' },
      root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 
                       'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
    
    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      cmd = { 'typescript-language-server', '--stdio' },
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    })
   vim.lsp.enable('svelte') 
    -- Python LSP
    vim.lsp.config('pyright', {
      capabilities = capabilities,
      cmd = { 'pyright-langserver', '--stdio' },
      root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 
                       'Pipfile', 'pyrightconfig.json', '.git' },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'workspace',
          },
        },
      },
    })
    
    -- C/C++ LSP
    vim.lsp.config('clangd', {
      capabilities = capabilities,
      cmd = { 'clangd', '--background-index', '--clang-tidy', '--completion-style=detailed' },
      root_markers = { 'compile_commands.json', 'compile_flags.txt', '.clangd', '.git' },
    })
    
    -- Enable LSPs for their respective filetypes
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lua',
      callback = function()
        vim.lsp.enable('lua_ls')
      end,
    })
    
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      callback = function()
        vim.lsp.enable('ts_ls')
      end,
    })
    
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      callback = function()
        vim.lsp.enable('pyright')
      end,
    })
    
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'c', 'cpp' },
      callback = function()
        vim.lsp.enable('clangd')
      end,
    })
  end,
}
