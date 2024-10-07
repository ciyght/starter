return {
  "jalvesaq/cmp-nvim-r",
  config = function()
    require("cmp").setup({
      formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- the truncated part when popup menu exceed maxwidth
            before = function(entry, item)
                local menu_icon = {
                    nvim_lsp = '',
                    vsnip = '',
                    path = '',
                    cmp_zotcite = 'z',
                    cmp_nvim_r = 'R'
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        })
    },
    sources = cmp.config.sources({
        { name = 'vsnip' },
        { name = 'cmp_zotcite' },
        { name = 'cmp_nvim_r' },
        { name = 'nvim_lsp' },
        { name = 'path', option = { trailing_slash = true } },
    }),
    })
  end,
}
