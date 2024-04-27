local workspaces = dofile(vim.fn.expand("~/Sync/docs/g/nvim/neorg_workspaces.lua"))
local default_workspace = dofile(vim.fn.expand("~/Sync/docs/g/nvim/neorg_default_workspace.lua"))
return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
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
}
