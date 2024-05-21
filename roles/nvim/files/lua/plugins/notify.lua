return {
  "rcarriga/nvim-notify",
  tag = "v3.13.4",
  config = function()
    local notify = require("notify")
    notify.setup({
      background_colour = "#000000"
    })
  end
}
