-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.nvim-tree'
require 'user.bufferline'
require 'user.lualine'
require 'user.cmp'
require 'user.comment'

require 'user.toggleterm'
require 'user.telescope'
require 'user.treesitter'

vim.cmd('colorscheme tokyonight')
vim.defer_fn(function() vim.cmd('colorscheme tokyonight') end, 100)
