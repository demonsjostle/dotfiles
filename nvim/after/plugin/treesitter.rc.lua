local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end


ts.setup {
  modules = {},
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
    "python",
    "javascript",
    "markdown",
    "markdown_inline",
    "typescript",
    "go"
  },
  auto_install = true,
  sync_install = false,
  ignore_install = {},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
