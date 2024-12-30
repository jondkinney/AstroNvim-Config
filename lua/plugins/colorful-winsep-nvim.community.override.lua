-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/split-and-window/colorful-winsep-nvim/init.lua
return {
  "nvim-zh/colorful-winsep.nvim",
  opts = {
    -- highlight for Window separator to match the nord color scheme
    hi = {
      bg = "#2E3440",
      fg = "#616E88",
    },
    anchor = {
      left = { height = 1, x = -1, y = -1 },
      right = { height = 1, x = -1, y = 0 },
      up = { width = 0, x = -1, y = 0 },
      bottom = { width = 0, x = 1, y = 0 },
    },
  },
}
