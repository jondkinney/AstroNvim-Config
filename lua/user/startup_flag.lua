local M = {}

-- Flag to indicate if Neovim has just started
M.just_started = true

-- Autocommand to unset the flag after startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function() M.just_started = false end,
})

return M
