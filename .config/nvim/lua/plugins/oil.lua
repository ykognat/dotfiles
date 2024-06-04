return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    local util = require("oil.util")

    -- Keymap to open Oil with preview, handling already open case
    vim.keymap.set('n', '<s-tab>', function()
      oil.open()
    end, { desc = "Open Oil" })

    -- Setup Oil plugin with any configuration options
    oil.setup({
      keymaps = {
        ["<tab>"] = "actions.select",
      },
    })
  end
}

