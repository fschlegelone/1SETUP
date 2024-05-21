return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.2",
  event = { "BufReadPre", "BufNewFile" }, -- lazy load when entering new or opened buffers
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      -- syntax highlighting
      highlight = {
        enable = true,
      },
      -- indenting
      indent = {
        enable = true,
      },
      -- autotagging
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "vim",
        "vimdoc",
        "bash",
        "comment",
        "css",
        "csv",
        "dockerfile",
        "gitignore",
        "gpg",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "properties",
        "python",
        "regex",
        "rust",
        "sql",
        "svelte",
        "ssh_config",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
