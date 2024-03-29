return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  config = function()
    require "configs.todo"
    dofile(vim.g.base46_cache .. "todo")
  end,
}
