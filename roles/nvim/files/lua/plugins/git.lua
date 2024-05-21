return {
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    tag = "v0.8.1",
    event = { "BufReadPre", "BufNewFile" }, -- lazy load when entering new or opened buffers
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-$m-$d> - <summary>",
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
      -- KEYMAPS
      keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns - preview hunk" }) -- preview hunk
      keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns - line blame" }) -- line blame
      keymap("n", "<leader>gg", ":vertical Git <CR>", { desc = "Git - toggle" }) -- toggle git window
    end,
  },
  -- git vim-fugitive
  {
    "tpope/vim-fugitive",
    tag = "v3.7",
  },
  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    branch = "main",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitConfigCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit - toggle" } },
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 0.8 -- scaling factor for floating window
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
      vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
    end,
  },
}
