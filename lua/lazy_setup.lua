require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    -- dev = true,
    -- dir = vim.fn.expand "~/Code/AstroNvim",
    version = "^4", -- Remove version tracking to elect for nighly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = ",", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = " ", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { import = "plugins" },
  { import = "plugins.experimental" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  rocks = { hererocks = true },
  ui = {
    backdrop = 80,
    -- border = "single",
  },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])

local astronvim_config = require("lazy.core.config").plugins["AstroNvim"]
if astronvim_config and astronvim_config.dev == true and astronvim_config.dir then
  local lazy_config = require "lazy.core.config"

  local default_install_path = lazy_config.options.root .. "/AstroNvim"
  if vim.fn.isdirectory(default_install_path) == 1 then
    vim.schedule(function()
      local choice = vim.fn.confirm("AstroNvim needs cleaning. Run :Lazy clean?", "&Yes\n&No", 2)
      if choice == 1 then
        require("lazy").clean()
        vim.notify("AstroNvim has been cleaned", vim.log.levels.INFO, {
          title = "AstroNvim Development Build",
          icon = "✨",
        })

        -- Prompt for restart
        vim.notify("Please restart Neovim manually to use the development version.", vim.log.levels.WARN, {
          title = "AstroNvim Development Build",
          icon = "⚠️",
        })
      end
    end)
  else
    vim.notify("RUNNING LOCAL ASTRONVIM FROM " .. astronvim_config.dir, vim.log.levels.WARN, {
      title = "AstroNvim Development Build",
      icon = "🚧",
    })
  end
end
