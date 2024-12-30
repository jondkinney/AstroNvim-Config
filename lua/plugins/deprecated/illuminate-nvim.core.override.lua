-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │                         Vim Illuminate Override                          │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- Override the default highlight groups for the illuminate plugin.

if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

--  NOTE: (2024-08-24) Jon => These settings aren't great, but this is an
--  example of how you'd do this if I do want to change it in the future.

return {
  "RRethy/vim-illuminate",

  config = function()
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#88C0D0", fg = "#2E3440" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#88C0D0", fg = "#2E3440" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#88C0D0", fg = "#2E3440" })
  end,
}
