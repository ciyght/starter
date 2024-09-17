vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Override NvChad indentation and line numbers
autocmd("BufEnter", {
  pattern = "*",
  callback = function ()
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.smartindent = true
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.relativenumber = true
  end
})

-- Vertical ruler
autocmd("VimEnter", {
  pattern = "*",
  command = "set colorcolumn=80",
})

-- -- LSP Diagnostics Options Setup 
-- local sign = function(opts)
--   vim.fn.sign_define(opts.name, {
--     texthl = opts.name,
--     text = opts.text,
--     numhl = ''
--   })
-- end
--
-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})
--
-- vim.diagnostic.config({
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--     underline = true,
--     severity_sort = false,
--     float = {
--         border = 'rounded',
--         source = 'always',
--         header = '',
--         prefix = '',
--     },
-- })

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
