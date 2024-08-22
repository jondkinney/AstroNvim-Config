return {
  "levouh/tint.nvim",
  event = "User AstroFile",
  opts = function()
    local transforms = require "tint.transforms"

    -- Custom function to determine if a window is NeoTree
    local function is_neotree(buf)
      local ft = vim.bo[buf].filetype
      return ft == "neo-tree"
    end

    return {
      highlight_ignore_patterns = {
        "WinSeparator",
        "Status.*",
      },
      window_ignore_function = function(winid)
        local buf = vim.api.nvim_win_get_buf(winid)
        return is_neotree(buf)
      end,
      transforms = {
        transforms.tint_with_threshold(-45, "#2E3440", 135),
        transforms.saturate(0.7),
      },
    }
  end,
}
