return {
  "hrsh7th/nvim-cmp",
  tag = "v0.0.1",
  event = "InsertEnter",
  dependencies = {
    -- source for text in buffer
    {
      "hrsh7th/cmp-buffer",
      branch = "main",
    },
    -- source for file system paths
    {
      "hrsh7th/cmp-path",
      branch = "main",
    },
    -- source for snippets
    {
      "L3MON4D3/LuaSnip",
      tag = "v2.3.0",
      build = "make install_jsregexp",
    },
    -- autocompletion
    {
      "saadparwaiz1/cmp_luasnip",
      branch = "master",
    },
    -- snippets
    {
      "rafamadriz/friendly-snippets",
      branch = "main",
    },
    -- pictograms
    {
      "onsails/lspkind.nvim",
      branch = "master",
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    -- load vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["Q"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      -- pictograms in completion menu (like in vscode)
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
