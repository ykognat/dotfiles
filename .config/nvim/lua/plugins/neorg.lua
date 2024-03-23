local workspaces = dofile(vim.fn.expand("~/Sync/docs/g/nvim/neorg_workspaces.lua"))
local default_workspace = dofile(vim.fn.expand("~/Sync/docs/g/nvim/neorg_default_workspace.lua"))
return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = workspaces,
              default_workspace = "sync_docs",
              autochdir = true,
              index = "index.norg"
            },
          },
        },
      }
    end,
  },
}
