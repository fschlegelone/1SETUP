return {
  "nvim-lua/plenary.nvim",
  tag = "v0.1.4",
  config = function()
    local async = require("plenary.async")
    local job = require("plenary.job")
    local scan = require("plenary.scandir")
  end
}
