return {
  'mhinz/vim-grepper',
  config = function()
    vim.cmd("let g:grepper = {}")
    vim.cmd("let g:grepper.tools = ['grep', 'git', 'rg']")
    vim.keymap.set("n", "<leader>*", ":Grepper -cword -noprompt<CR>", {})
    vim.cmd("nmap gs <plug>(GrepperOperator)")
    vim.cmd("xmap gs <plug>(GrepperOperator)")
  end,
}
