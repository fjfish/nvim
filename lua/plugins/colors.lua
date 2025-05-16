-- lua/plugins/colors.lua
return {
  {
    "altercation/vim-colors-solarized",
    lazy = false, -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
      vim.o.background = "dark" -- or "light"
      vim.cmd("colorscheme solarized")
    end,
  },
}
