return {
  'stevearc/oil.nvim',
  opts = {
      keymaps = {
        ["<tab>"] = "actions.select",
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

