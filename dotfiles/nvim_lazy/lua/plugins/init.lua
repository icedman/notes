return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      local scrollbar = require("scrollbar").setup({})
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  }
}
