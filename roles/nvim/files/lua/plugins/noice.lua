return {
  "folke/noice.nvim",
  tag = "v3.0.1",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local noice = require("noice")
    noice.setup({})
  end,
}
