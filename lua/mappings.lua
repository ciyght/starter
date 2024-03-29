require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- custom keybinds!
map("n", "<F5>", "<cmd> ! python3 % <CR>", { desc = "Run Python3 script" })
map("n", "<leader>bb", "<cmd> ! black % <CR> ", { desc = "Run Black formatter" })
map("n", "<leader>gg", ":LazyGit <CR>", { desc = "Open LazyGit" })

-- harpoon
map("n", "<leader>ha", function()
  local harpoon = require "harpoon"
  harpoon:list():append()
end, { desc = "󱡁 Harpoon Add file" })
map("n", "<leader>ta", "<CMD>Telescope harpoon marks<CR>", { desc = "󱡀 Toggle quick menu" })
map("n", "<leader>hb", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "󱠿 Harpoon Menu" })
map("n", "<leader>1", function()
  local harpoon = require "harpoon"
  harpoon:list():select(1)
end, { desc = "󱪼 Navigate to file 1" })
map("n", "<leader>2", function()
  local harpoon = require "harpoon"
  harpoon:list():select(2)
end, { desc = "󱪼 Navigate to file 2" })
map("n", "<leader>3", function()
  local harpoon = require "harpoon"
  harpoon:list():select(3)
end, { desc = "󱪼 Navigate to file 3" })
map("n", "<leader>4", function()
  local harpoon = require "harpoon"
  harpoon:list():select(4)
end, { desc = "󱪼 Navigate to file 4" })
