-- https://github.com/OXY2DEV/markview.nvim
return {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "markdown.mdx" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "html", "markdown", "markdown_inline" })
      end
    end,
  },
  opts = function()
    local presets = require "markview.presets"

    return {
      modes = { "n", "i", "no", "c" },
      hybrid_modes = { "i" },
      headings = presets.headings.glow_labels,
      -- This is nice to have
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "nc"
        end,
      },
    }
  end,
}
