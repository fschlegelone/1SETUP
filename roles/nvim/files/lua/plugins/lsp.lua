return {
  "neovim/nvim-lspconfig",
  tag = "v0.1.7",
  event = { "BufReadPre", "BufNewFile" }, -- event for lazyloading
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- integrate completion with lsp
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import plugins
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    -- autocmd
    autocmd("LspAttach", {
      group = augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        -- KEYMAPS
        -- show definition, references
        opts.desc = "Show LSP references"
        keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        -- go to declaration
        opts.desc = "Go to declaration"
        keymap("n", "gD", vim.lsp.buf.declaration, opts)
        -- show lsp definitions
        opts.desc = "Show LSP definitions"
        keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        -- show lsp implementations
        opts.desc = "Show LSP implementations"
        keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        -- show lsp type definitions
        opts.desc = "Show LSP type definitions"
        keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        -- see available code actions, in visual mode will apply to selection
        opts.desc = "See available code actions"
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        -- smart rename
        opts.desc = "Smart rename"
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        -- show  diagnostics for file
        opts.desc = "Show buffer diagnostics"
        keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        -- show diagnostics for line
        opts.desc = "Show line diagnostics"
        keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
        -- jump to previous diagnostic in buffer
        opts.desc = "Go to previous diagnostic"
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)
        -- jump to next diagnostic in buffer
        opts.desc = "Go to next diagnostic"
        keymap("n", "]d", vim.diagnostic.goto_next, opts)
        -- show documentation for what is under cursor
        opts.desc = "Show documentation for what is under cursor"
        keymap("n", "K", vim.lsp.buf.hover, opts)
        -- mapping to restart lsp if necessary
        opts.desc = "Restart LSP"
        keymap("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- used for autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default lsp handler
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        -- lua lsp handler
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
