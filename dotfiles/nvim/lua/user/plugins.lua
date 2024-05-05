-- Load Packer
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  local packer_path = vim.fn.stdpath('data') ..
                          '/site/pack/packer/opt/packer.nvim'
  vim.fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path
  })
  vim.cmd('packadd packer.nvim')
end

-- Configure Packer
require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Add your plugins here
  -- Example: use {'author/plugin-name'}
  use {'nvim-tree/nvim-tree.lua'}
  use {'nvim-tree/nvim-web-devicons'}
  use {'akinsho/bufferline.nvim'}
  use {'hoob3rt/lualine.nvim'}
  use {'numToStr/Comment.nvim'}
  use {'akinsho/toggleterm.nvim'}

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-path'}
      -- Other sources or completion engines as needed
    }
  }

  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- color schemes
  use {'folke/tokyonight.nvim'}
end)

-- Automatically compile and load configuration changes
-- vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
-- vim.cmd('autocmd BufWritePost plugins.lua PackerInstall')
-- vim.cmd('autocmd BufWritePost plugins.lua PackerClean')

