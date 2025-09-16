local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
  ensure_installed = {
    "lua", "python", "javascript", "typescript", "html", "css", "json",
    "bash", "markdown", "vim", "yaml"
  },
  ignore_install = {},

  highlight = {
    enable = true,
    disable = { "css" }
  },

  indent = {
    enable = false,
    disable = { "python", "css" }
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<S-CR>",
      scope_incremental = "<S-CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>"
    }
  }
})

-- Set folding method via vim options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
