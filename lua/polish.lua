-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- function SearchCodebaseAndOpenTrouble(pattern)
--   -- Get the git root directory
--   local git_root = vim.fn.system("git rev-parse --show-toplevel 2> /dev/null"):gsub("\n", "")
--
--   if git_root == "" then
--     print "Not in a git repository. Searching from current directory."
--     git_root = vim.fn.getcwd()
--   end
--
--   -- Construct the ripgrep command
--   local cmd = "rg --vimgrep --smart-case "
--   if pattern and pattern ~= "" then
--     cmd = cmd .. vim.fn.shellescape(pattern) .. " "
--   else
--     cmd = cmd .. "'.*' " -- Match any content if no pattern is provided
--   end
--   cmd = cmd .. git_root
--
--   -- Use Neovim's job control to run the command asynchronously
--   local job_id = vim.fn.jobstart(cmd, {
--     on_stdout = function(_, data)
--       if data then vim.fn.setqflist({}, "a", { lines = data }) end
--     end,
--     on_exit = function(_, exit_code)
--       if exit_code == 0 then
--         local qf_length = #vim.fn.getqflist()
--         if qf_length > 0 then
--           vim.cmd "Trouble quickfix"
--           print(string.format("Found %d results.", qf_length))
--         else
--           print "No results found."
--         end
--       else
--         print "Error occurred while searching."
--       end
--     end,
--   })
--
--   if job_id <= 0 then print "Failed to start the search job." end
-- end
--
-- vim.api.nvim_create_user_command(
--   "TroubleAll",
--   function(opts) SearchCodebaseAndOpenTrouble(opts.args) end,
--   { nargs = "?" }
-- )
