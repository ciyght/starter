return {
  "HiPhish/rainbow-delimiters.nvim",
  branch = "master",
  lazy = false,
  config = function ()
    require("rainbow-delimiters.setup").setup({
      query = {
        [''] = 'rainbow-delimiters',
        latex = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
      blacklist = {},
    })
  end
}
