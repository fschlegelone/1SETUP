local M = {}

M.opts = {
    defaults = {
        lazy = false,
    },
    ui = {
        size = { 
            width = 0.6,
            height = 0.6
        },
        border = "none",
        backdrop = 100,
    },
    checker = {
        enabled = true,
        notify = true,
        frequency = 86400,
        check_pinned = true,
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            paths = {},
            disabled_plugins = {},
        },
    },
   -- custom keymaps 
    custom_keys = {
          ["<leader>l"] = {
        function(plugin)
          require("lazy.util").float_term({ "lazygit", "log" }, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open lazygit log",
      },
    },

}

return M
