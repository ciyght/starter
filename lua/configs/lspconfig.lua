-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "html", "cssls", "tsserver", "pyright", "texlab", "ltex" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--offset-encoding=utf-16" },
})

lspconfig.omnisharp.setup({
  -- configure omnisharp to fix the semantic tokens bug (really annoying)
  omnisharp = function(_, _)
    require("lazyvim.util").on_attach(function(client, _)
      if client.name == "omnisharp" then
        ---@type string[]
        local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        for i, v in ipairs(tokenModifiers) do
          tokenModifiers[i] = v:gsub(" ", "_")
        end
        ---@type string[]
        local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        for i, v in ipairs(tokenTypes) do
          tokenTypes[i] = v:gsub(" ", "_")
        end
      end
    end)
    return false
  end,
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "/home/koen/.local/share/nvim/mason/bin/omnisharp" }
})
