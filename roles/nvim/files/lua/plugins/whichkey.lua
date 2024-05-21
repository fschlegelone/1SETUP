return {
  "folke/which-key.nvim",
  tag = "v1.6.0",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 900 -- time whichkey opens after pressing leaderkey
  end,
  opts = {},
}
