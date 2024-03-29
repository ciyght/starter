return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  -- run = function()
  --   vim.fn["mkdp#util#install"]()
  -- end,
  setup = function()
    vim.g.mkdp_browser = { "/usr/bin/firefox" }
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_page_title = "${name}.md"
    vim.g.mkdp_theme = "dark"
  end,
  ft = { "markdown" },
}
