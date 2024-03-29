return {
  "lervag/vimtex",
  lazy=false,
  init = function()
    vim.g.syntax_on = 0
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
  end
}
