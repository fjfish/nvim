return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function()
    vim.api.nvim_create_user_command('Glog', ':Git log --pretty=format:"%h %ad %an %s" --date=format:"%Y/%m/%d %H:%M"', {})
  end
}
