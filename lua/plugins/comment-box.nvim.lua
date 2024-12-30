-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │ This is a comment box and it makes comments look prettier                │
-- │                                                                          │
-- │ https://github.com/LudoPinelli/comment-box.nvim                          │
-- ╰──────────────────────────────────────────────────────────────────────────╯
return {
  "LudoPinelli/comment-box.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>c"] = { "□ Comment Boxes" },
            ["<Leader>cb"] = { "<cmd>CBccbox<cr>", desc = "Box Title" },
            ["<Leader>ct"] = { "<cmd>CBllline<cr>", desc = "Titled Line" },
            ["<Leader>cl"] = { "<cmd>CBline<cr>", desc = "Simple Line" },
            ["<Leader>cm"] = { "<cmd>CBllbox14<cr>", desc = "Marked" },
            ["<Leader>cd"] = { "<cmd>CBd<cr>", desc = "Remove a box" },
            --
            ["<Leader>cn"] = { "/\\S\\zs\\s*╭<CR>zt", desc = "Next block comment" },
            ["<Leader>cp"] = { "?\\S\\zs\\s*╭<CR>zt", desc = "Previous block comment" },
          },
        },
      },
    },
  },
  event = "User AstroFile",
  opts = {
    box_width = 77, -- width of the boxes
    line_width = 78, -- width of the lines
  },
}
