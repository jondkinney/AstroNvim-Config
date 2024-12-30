if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    sections = {
      lualine_y = {
        { require("recorder").displaySlots },
      },
      lualine_z = {
        { require("recorder").recordingStatus },
      },
    },
  },
}
