---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "astronvim.plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      require("telescope").load_extension "githubcoauthors"
    end,
  },

  vim.keymap.set(
    "n",
    "<leader>ga",
    function() require("telescope").extensions.githubcoauthors.coauthors() end,
    { desc = "Github CoAuthors" }
  ),

  vim.keymap.set("n", "gD", "<cmd>VtsExec goto_source_definition<CR>", { desc = "goto source definition" }),
}
