return {
  "folke/trouble.nvim",
  tag = "v2.10.0",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "trouble: open/close list" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "trouble: Open workspace diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "trouble: Open document diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "trouble: Open quickfix list" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "trouble: Open location list" },
  },
  config = function()
    local trouble = require("trouble")
    trouble.setup({})
  end,
}
