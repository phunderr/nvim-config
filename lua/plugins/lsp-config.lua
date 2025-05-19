return {
  {
    "mason-org/mason.nvim",
    config = function ()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function() 
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls" },
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls')
    end
  }
}
