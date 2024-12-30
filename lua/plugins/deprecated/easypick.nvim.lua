if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- I wrote a custom version of this that uses the telescope extension. But it
-- doesn't check for conficts, only changed files. I'd like to update my
-- version to check for conflict files as well.

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "axkirillov/easypick.nvim",
    lazy = false,
  },
  config = function(plugin, opts)
    local easypick = require "easypick"

    require "astronvim.plugins.configs.telescope"(plugin, opts)
    require("telescope").load_extension "easypick"

    -- only required for the example to work
    local get_default_branch = "git rev-parse --symbolic-full-name refs/remotes/origin/HEAD | sed 's!.*/!!'"
    local base_branch = vim.fn.system(get_default_branch):gsub("\n", "") or "main"

    easypick.setup {
      pickers = {
        -- add your custom pickers here
        -- below you can find some examples of what those can look like

        -- list files inside current folder with default previewer
        {
          -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
          name = "ls",
          -- the command to execute, output has to be a list of plain text entries
          command = "ls",
          -- specify your custom previwer, or use one of the easypick.previewers
          previewer = easypick.previewers.default(),
        },

        -- diff current branch with base_branch and show files that changed with respective diffs in preview
        {
          name = "changed_files",
          command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
          previewer = easypick.previewers.branch_diff { base_branch = base_branch },
        },

        -- list files that have conflicts with diffs in preview
        {
          name = "conflicts",
          command = "git diff --name-only --diff-filter=U --relative",
          previewer = easypick.previewers.file_diff(),
        },
      },
    }
  end,
}
