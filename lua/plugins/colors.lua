-- lua/plugins/colors.lua
return {
  {
    "shaunsingh/solarized.nvim",
    lazy = false, -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
      vim.o.background = "light" -- or "dark"
      vim.cmd("colorscheme solarized")
    end,
  },
}
