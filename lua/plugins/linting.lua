return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "mypy", "flake8" },
      c = { "clangtidy", "cppcheck" },
      tex = { "chktex", "codespell" },
    }
  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" },
    {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    }
  )
  local chktex = require('lint').linters.chktex
    chktex.args = {'-n8', '-v0', '-I0', '-s', ':', '-f', '%l%b%c%b%d%b%k%b%n%b%m%b%b%b'}
  end
}
