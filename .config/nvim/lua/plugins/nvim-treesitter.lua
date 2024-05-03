return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "rust", "sql", "nix", "bash", "python", "norg", "json", "jsonc", "css" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
      -- local parsers = require "nvim-treesitter.parsers"
      -- local parser_config = parsers.get_parser_configs()
      -- parser_config.jsonc.filetype_to_parsername = "json"
    end
 }
}
