vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN, -- Show warnings and errors
    }
  },
  signs = {
    severity = {
      min = vim.diagnostic.severity.WARN, -- Show signs for warnings and errors
    }
  },
  float = {
    border = "rounded",
    source = true,
  },
})

-- Keymaps for diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>q", ":lua vim.diagnostic.setqflist()<CR>", { desc = "Populate quickfix with diagnostics" })

