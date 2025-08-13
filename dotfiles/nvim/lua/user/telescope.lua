local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = {"smart"}
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fd', ':Telescope fd<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope grep_string<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Telescope treesitter<CR>',
                        {noremap = true, silent = true})

