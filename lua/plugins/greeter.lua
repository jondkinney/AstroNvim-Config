--============================================================================--
--
-- https://github.com/goolord/alpha-nvim
--
--============================================================================--
--
-- This plugin provides a customizable startup screen for neovim, overriding the
-- default dashboard header provided by AstroNvim.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                                                           ",
        "██   ██ ███████  █████  ██████  ██     ██  █████  ██    ██ ",
        "██   ██ ██      ██   ██ ██   ██ ██     ██ ██   ██  ██  ██  ",
        "███████ █████   ███████ ██   ██ ██  █  ██ ███████   ████   ",
        "██   ██ ██      ██   ██ ██   ██ ██ ███ ██ ██   ██    ██    ",
        "██   ██ ███████ ██   ██ ██████   ███ ███  ██   ██    ██    ",
      }
      return opts
    end,
  },
}
