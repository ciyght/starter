return {
  "neovim/nvim-lspconfig",
  config = function()
    require('nvchad.configs.lspconfig').defaults()
    require "configs.lspconfig"
  end, -- Override to setup mason-lspconfig
}
