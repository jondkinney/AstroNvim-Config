---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "astronvim.plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      require("telescope").load_extension "git_changed_on_branch"
    end,
  },

  vim.keymap.set(
    "n",
    "<leader>fg",
    function() require("telescope").extensions.git_changed_on_branch.show_files() end,
    { desc = "Find files changed on current branch" }
  ),
}
