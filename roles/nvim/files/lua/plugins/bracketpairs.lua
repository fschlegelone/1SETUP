return {
  "lukas-reineke/indent-blankline.nvim",
  tag = "v3.6.1",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  main = "ibl",
  opts = {
    indent = {
      char = "┊",
    },
  },
}
