return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "c",
      "c_sharp",
      "markdown",
      "markdown_inline",
      "python",
    },
    indent = {
      enable = true,
    }
  },
}
