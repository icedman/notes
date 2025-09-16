return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      sort = {sorter = "case_sensitive"},
      view = {width = 30},
      renderer = {group_empty = true},
      filters = {dotfiles = true}
    })

    vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>',
      {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<A-n>', ':NvimTreeRefresh<CR>',
      {noremap = true, silent = true})

  end,
}

