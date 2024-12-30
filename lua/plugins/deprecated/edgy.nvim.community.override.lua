return {
  "folke/edgy.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>s"] = { name = "Sidebars" },
            ["<Leader>sT"] = { function() require("edgy").toggle() end, desc = "Toggle Sidebars" },
            ["<Leader>st"] = { function() require("edgy").select() end, desc = "Pick Sidebar" },
          },
        },
      },
    },
  },
  opts = {
    exit_when_last = true,
    -- not sure if this is working?
    bottom = {
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- don't open help files in edgy that we're editing
        filter = function(buf) return vim.bo[buf].buftype == "help" end,
      },
    },
    left = {},
    right = {
      {
        ft = "aerial",
        title = "Symbol Outline",
        pinned = true,
        open = function() require("aerial").open() end,
      },
    },
  },
}
