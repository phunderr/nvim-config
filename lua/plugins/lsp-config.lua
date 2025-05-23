return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer"
      },
    },
    depedencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  { 
    "neovim/nvim-lspconfig", 
    opts = function()
      local ret = {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = "Disable",
                  semicolon = "Disable",
                  arrayIndex = "Disable",
                },
              },
            },
          },
        },
      setup = {},
      }
      return ret
   end,
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers) do
        require("lspconfig")[server].setup(server_opts)
      end
    end,
  },
}
