-- may not need this? Need to research further. It was disabled temporarily for Lazy.nvim because it was causing issues, apparently.
if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "vhyrro/luarocks.nvim",
  priority = 1001, -- this plugin needs to run before anything else
  opts = {
    rocks = { "magick" },
  },
}
