return {
  "williamboman/mason.nvim",
  tag = "v1.10.0",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "check",
          package_pending = "pending",
          package_uninstalled = "uninstalled",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ansiblels", -- ansible
        "bashls", -- bash
        "cssls", -- css
        "dockerls", -- docker
        "docker_compose_language_service", -- docker compose
        "gopls", -- go
        "graphql", -- graphAPI
        "tsserver", -- typescript & javascript
        "pyright", -- python
        "html", -- html
        "jsonls", -- json
        "jdtls", -- java
        "lua_ls", -- lua
        "marksman", -- markdown
        "powershell_es", -- powershell
        "prismals", -- prisma
        "sqlls", -- sql
        "taplo", -- toml
        "terraformls", -- terraform
        "lemminx", -- xml
        "yamlls", -- yaml
      },
    })
    mason_tool_installer.setup({
      ensure_installed = {
        -- formatters
        "prettier",
        "stylua",
        "isort",
        "black",
        -- linters
        "pylint",
        "eslint_d",
      },
    })
  end,
}
