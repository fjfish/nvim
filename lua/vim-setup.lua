vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=noselect:full")
vim.cmd("set wildoptions=fuzzy,pum")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.keymap.set('c', '%%', function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand('%:h') .. '/'
  else
    return '%%'
  end
end, { expr = true, noremap = true })
-- Auto-save when leaving a buffer
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",    -- Apply to all buffers
  command = "silent! wall", -- The command to run (write all modified buffers silently)
  -- Optional: group = "MyAutocmdGroup", -- You can put autocmds in a group for easier management
})

