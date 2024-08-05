--============================================================================--
--
-- https://aider.chat/
-- https://github.com/joshuavial/aider.nvim
-- https://github.com/joshuavial/aider.nvim (my fork)
--
--============================================================================--
--
-- Aider is a command line tool that provides context-aware, AI powered, code
-- creation. Provide aider with a context and it will generate code for you
-- making a sensible git commit message and committing the changes for review.
--
-- Changes can be reverted via the /undo command if you want to try a different
-- prompt or include/excluce certgain files for aider to operate on in a
-- subsequent attempt
--
-- The plugin specified above by josuavial is a neovim plugin that provides
-- access to aider in a term split within the neovim window.
--
-- IMPORTANT PLUGIN CONFIG OPTIONS:
--   { auto_manage_context = true }
--   Add any open buffers to the context for aider to use. If a buffer is
--   closed, it will be removed from the context automatically.
--
--   { vim = true }
--   Sets the Aider config option to allow for interacting with the cursor in
--   the aider split like a vim buffer
--
--
-- IMPORTANT AIDER CONFIG OPTIONS:
--   NOTE: These should be set in ~/.aider.config.yml
--
--   ## Specify the OpenAI API key
--   openai-api-key: sk-proj-abc1345-abc1345-abc134 (replace with your own key)
--
--   ## Specify the Anthropic API key
--   anthropic-api-key: sk-ant-api03-IHmodf5_vn05ab (replace with your own key)
--
--   ## Enable/disable auto commit of LLM changes (default: True)
--   auto-commits: true
--
--   ## Enable/disable commits when repo is found dirty (default: True)
--   dirty-commits: true
--
--   NOTE: about the following two settings. From Git definitions:
--   * The AUTHOR is the person who originally wrote the work.
--   * The COMMITTER is the person who most recently applied a set of changes,
--   for example by using commands such as rebase or cherry-pick.
--
--   ## Attribute aider code changes in the git author name (default: True)  NOTE: I suggest changing the default
--   attribute-author: false # Use the author name configured in ~/.gitconfig
--
--   ## Attribute aider commits in the git committer name (default: True)  NOTE: I suggest changing the default
--   attribute-committer: false
--
--   ## Prefix commit messages with 'aider: ' (default: False)
--   attribute-commit-message: true  NOTE: it's good to know which commits were generated by aider.
--
--   ## Specify lint commands to run for different languages, eg: "python: flake8 --select=..." (can be used multiple times)
--   lint-cmd: yarn run format:check  NOTE: ensure the code is formatted to project preferences. format:check is a custom yarn command that needs to be created in the project.
--
--  NOTE: this plugin is currently pointing to my fork, locally. For some unknown reason, the main plugin is broken.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  -- "joshuavial/aider.nvim", -- FIXME: broken
  -- "jondkinney/aider.nvim", -- use this fork until https://github.com/joshuavial/aider.nvim/pull/13 is merged
  dir = "~/Code/aider.nvim",
  config = function()
    require("aider").setup {
      auto_manage_context = true,
      default_bindings = true,
      debug = false,
      vim = true,
    }
  end,
}
