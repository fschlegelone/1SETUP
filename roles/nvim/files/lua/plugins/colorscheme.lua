return {
  "catppuccin/nvim",
  tag = "v1.7.0",
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      --			background = "dark",
      transparent_background = true,
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      highlight_overrides = {
        all = function(mocha)
          return {
            -- bg1: base
            -- bg2: mantle
            -- bg3
            -- fg1: text
            -- fg2: #f2f2f2
            -- accent1: pink
            -- accent2: teal
            -- accent3: lavender
            LineNr = { fg = mocha.teal },
            Comment = { fg = mocha.overlay0 },
            CmpBorder = { fg = mocha.red },
          }
        end,
      },
      integrations = {
        neotree = true,
        alpha = true,
        mason = true,
        treesitter = true,
        telescope = {
          enabled = true,
        },
        which_key = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
