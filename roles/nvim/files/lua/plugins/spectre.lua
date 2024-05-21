return {
  "nvim-pack/nvim-spectre",
  branch = "master",
  dependencies = {
    "BurntSushi/ripgrep",
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local spectre = require("spectre")
    -- custom open function
    -- require("spectre.actions").get_current_entry()
    -- require("spectre.actions").get_all_entries()
    -- require("spectre.actions").get_state()

    --    spectre.open({
    --      is_insert_mode = true,
    --      cwd = "~/.config/nvim",
    --      search_text = "spectre_test_123",
    --      replace_text = "spectre_test_xyz",
    --      path = "lua/**/*.lua", -- filepattern to search in
    --      search_paths = { "lua/", "plugins/" },
    --      is_close = false, -- close, exit & re-open spectre instance
    --    })
    -- spectre (find + replace)
    keymap("n", "<leader>rr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
    keymap(
      "n",
      "<leader>rw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      { desc = "Search current word" }
    )
    keymap("v", "<leader>rw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
    keymap(
      "n",
      "<leader>rf",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      { desc = "Search on current file" }
    )
  end,
}
