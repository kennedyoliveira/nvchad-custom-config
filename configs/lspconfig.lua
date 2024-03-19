local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local navic = require "nvim-navic"

-- if you just want default config for the servers then put them in a table
local servers =
{ "html", "cssls", "tsserver", "clangd", "gopls", "docker_compose_language_service", "dockerls", "marksman" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      -- call the default on attach
      on_attach(client, bufnr)
      
      -- setup navic on attach function
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
