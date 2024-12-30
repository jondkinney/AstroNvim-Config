local builtin = require "telescope.builtin"
local config = require "telescope.config"

-- Return a list of files found in quickfix, skipping duplicates
local quickfix_files = function()
  local qflist = vim.fn.getqflist()
  local files = {}
  local seen = {}
  for k in pairs(qflist) do
    local path = vim.fn.bufname(qflist[k]["bufnr"])
    if not seen[path] then
      files[#files + 1] = path
      seen[path] = true
    end
  end
  table.sort(files)
  return files
end

-- Invoke live_grep on all files in quickfix
local grep_on_quickfix = function()
  local args = {}

  for _i, v in ipairs(config.values.vimgrep_arguments) do
    args[#args + 1] = v
  end
  for _i, v in ipairs(quickfix_files()) do
    args[#args + 1] = "-g/" .. v
  end

  builtin.live_grep { vimgrep_arguments = args }
end

---@type LazySpec
return {
  vim.keymap.set("n", "<Leader>fx", grep_on_quickfix, { desc = "Find words in quickfix files" }),
}
