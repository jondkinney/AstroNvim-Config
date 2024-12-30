local startup_flag = require "user.startup_flag"

local M = {}

-- Function to handle opening Neo-tree if it's the only buffer open
local function handle_neo_tree_open()
  -- Check if Neo-tree is the only buffer open
  local buffers = vim.api.nvim_list_bufs()
  local visible_buffers = 0
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then visible_buffers = visible_buffers + 1 end
  end

  if visible_buffers == 1 then
    vim.schedule(function()
      if not pcall(require, "neo-tree.command") then
        vim.notify("Neo-tree is not available", vim.log.levels.ERROR)
        return
      end
      require("neo-tree.command").execute { action = "show", dir = vim.fn.getcwd() }
    end)
  end
end

-- Setup function for the plugin
function M.setup()
  -- Autocommand to trigger after opening a file from Telescope
  vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
      -- Check if Neovim just started or if we're in a kitty-scrollback buffer
      if startup_flag.just_started then return end
      -- Check if the file was opened from Telescope and not a Neo-tree buffer
      if vim.bo.filetype ~= "TelescopePrompt" and vim.bo.filetype ~= "neo-tree" and vim.fn.expand "<afile>" ~= "" then
        if vim.env.KITTY_SCROLLBACK_NVIM ~= "true" then handle_neo_tree_open() end
      end
    end,
  })
end

return M
