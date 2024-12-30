---@type LazySpec
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local Path = require "plenary.path" -- We use plenary for file path manipulations

local function find_kitty_socket()
  local socket_dir = "/tmp/"
  local handle = io.popen("ls -1 " .. socket_dir .. " | grep mykitty")
  local result = handle:read "*a"
  handle:close()
  result = vim.split(result, "\n")
  for _, line in ipairs(result) do
    if line ~= "" then return "unix:" .. socket_dir .. line end
  end
  return nil
end

local open_in_new_kitty_tab = function(prompt_bufnr)
  local selected_entry = action_state.get_selected_entry()
  local file_path = selected_entry.path or selected_entry.filename

  if not file_path then
    print "No file selected!"
    return
  end

  -- Close the Telescope prompt
  actions.close(prompt_bufnr)

  -- Get the directory of the selected file
  local file_dir = Path:new(file_path):parent():absolute()

  -- Debug output
  print("Opening new Kitty tab in directory: " .. file_dir)

  -- Find the correct Kitty socket
  local socket_path = find_kitty_socket()
  if not socket_path then
    print "Error: Could not find Kitty socket"
    return
  end

  -- Command to launch a new Kitty tab using the socket
  local command =
    string.format("kitty @ --to=%s launch --type=tab --cwd=%s nvim %s +Neotree", socket_path, file_dir, file_path)

  -- Debug output
  print("Executing command: " .. command)

  -- Use vim.fn.system to execute the command
  local result = vim.fn.system(command)

  -- Print the result for debugging
  print("Command result: " .. result)

  -- Check for errors
  local success = vim.v.shell_error == 0
  if not success then
    print("Error executing command: " .. result)
  else
    print "Command executed successfully"
  end
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
          ["<C-9>"] = open_in_new_kitty_tab, -- Map Ctrl+9 to open in new Kitty tab
        },
        n = {
          ["<C-9>"] = open_in_new_kitty_tab, -- Normal mode mapping for new Kitty tab
        },
      },
    },
  },
}
--  FIXME: (2024-08-29) Jon => does this work?
