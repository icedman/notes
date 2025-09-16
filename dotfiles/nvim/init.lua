-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.nvim-tree'
require 'user.bufferline'
require 'user.dressing'
require 'user.lualine'
require 'user.cmp'
require 'user.comment'

require 'user.toggleterm'
require 'user.telescope'
require 'user.treesitter'
require 'nvim-textmate'

vim.o.foldmethod = 'manual'
vim.o.foldlevel = 99

vim.cmd('colorscheme tokyonight')
vim.defer_fn(function() vim.cmd('colorscheme tokyonight') end, 100)

require("scrollbar").setup({})
