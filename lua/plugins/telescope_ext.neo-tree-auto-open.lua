--============================================================================--
--
-- https://github.com/nvim-telescope/telescope.nvim
--
--============================================================================--
--

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    -- Load the custom Neo-tree auto open module
    require("user.neo_tree_auto_open").setup()
  end,
}
