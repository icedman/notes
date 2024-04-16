local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then return end

require('bufferline').setup {
  options = {
    offsets = {{filetype = "NvimTree", text = "", text_align = "center"}},
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end
  }
}
