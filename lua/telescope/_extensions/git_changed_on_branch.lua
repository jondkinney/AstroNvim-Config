local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- Functions for persisting the last selected branch
local function get_storage_path()
  local config_dir = vim.fn.stdpath "config"
  return config_dir .. "/last_selected_branches.json"
end

local function save_last_branch(project_dir, branch)
  local storage_path = get_storage_path()
  local data = {}

  -- Load existing data
  local file = io.open(storage_path, "r")
  if file then
    local content = file:read "*all"
    data = vim.fn.json_decode(content) or {}
    file:close()
  end

  -- Update data with the new branch
  data[project_dir] = branch

  -- Save updated data
  file = io.open(storage_path, "w")
  if file then
    file:write(vim.fn.json_encode(data))
    file:close()
  end
end

local function load_last_branch(project_dir)
  local storage_path = get_storage_path()
  local data = {}

  -- Load existing data
  local file = io.open(storage_path, "r")
  if file then
    local content = file:read "*all"
    data = vim.fn.json_decode(content) or {}
    file:close()
  end

  return data[project_dir]
end

local function get_project_dir() return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t") end

local function get_git_branches()
  local branches = {}
  local handle = io.popen "git branch --format='%(refname:short)'"
  if handle then
    for branch in handle:lines() do
      branches[#branches + 1] = branch:gsub("'", "") -- Remove single quotes
    end
    handle:close()
  else
    print "Error: Unable to get git branches"
  end
  return branches
end

local function get_current_branch()
  local handle = io.popen "git rev-parse --abbrev-ref HEAD"
  if handle then
    local current_branch = handle:read("*all"):gsub("\n", "")
    handle:close()
    return current_branch
  else
    return nil
  end
end

-- Forward declaration of show_modified_files
local show_modified_files

local function show_branch_picker(opts)
  local branches = get_git_branches()

  if #branches == 0 then
    print "No branches found"
    return
  end

  -- Find the index of the last selected branch
  local default_index = 1
  local last_selected_branch = load_last_branch(get_project_dir())
  if last_selected_branch then
    for i, branch in ipairs(branches) do
      if branch == last_selected_branch then
        default_index = i
        break
      end
    end
  end

  pickers
    .new(opts, {
      prompt_title = "Select the branch that '" .. get_current_branch() .. "' will be merged into for comparison",
      results_title = "Note: the selected branch will be saved as the base of comparison until changed.",
      finder = finders.new_table {
        results = branches,
      },
      sorter = sorters.get_generic_fuzzy_sorter(),
      default_selection_index = default_index, -- Set default selection
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          last_selected_branch = selection[1] -- Store the selected branch
          save_last_branch(get_project_dir(), last_selected_branch) -- Save to file
          show_modified_files(opts, selection[1])
        end)
        return true
      end,
    })
    :find()
end

-- Now define show_modified_files
show_modified_files = function(opts, selected_branch)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.fn.getcwd()

  local current_branch = get_current_branch()
  local command = { "git", "diff", "--name-only", "--diff-filter=ACMR", "--relative", selected_branch }

  pickers
    .new(opts, {
      prompt_title = "Modified files (all time): " .. current_branch .. " -> " .. selected_branch,
      results_title = "Press <C-b> to switch back to the branch list.",
      finder = finders.new_oneshot_job(command, opts),
      sorter = sorters.get_fuzzy_file(),
      previewer = previewers.new_termopen_previewer {
        get_command = function(entry)
          return {
            "git",
            "diff",
            "--diff-filter=ACMR",
            "--relative",
            selected_branch,
            "--",
            entry.value,
          }
        end,
        cwd = opts.cwd,
      },
      attach_mappings = function(prompt_bufnr, map)
        -- Add a new mapping to go back to branch selection
        map("i", "<C-b>", function()
          actions.close(prompt_bufnr)
          show_branch_picker(opts)
        end)
        map("n", "<C-b>", function()
          actions.close(prompt_bufnr)
          show_branch_picker(opts)
        end)
        return true
      end,
    })
    :find()
end

return require("telescope").register_extension {
  exports = {
    show_files = function(opts)
      opts = opts or {}

      -- Check if we're in a git repository
      local is_git_repo = os.execute "git rev-parse --is-inside-work-tree > /dev/null 2>&1"
      if is_git_repo ~= 0 then
        print "Error: Not in a git repository"
        return
      end

      local project_dir = get_project_dir()
      local last_selected_branch = load_last_branch(project_dir)

      if last_selected_branch then
        show_modified_files(opts, last_selected_branch)
      else
        show_branch_picker(opts)
      end
    end,
  },
}
