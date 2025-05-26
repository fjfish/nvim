vim.g.enable_dynamic_window_resize = false

local function adjust_window_size()
  if not vim.g.enable_dynamic_window_resize then
    return -- Do nothing if the feature is disabled
  end

  local target_width_percent = 0.70  -- 70%
  local target_height_percent = 0.70 -- 70%

  local total_cols = vim.o.columns
  local total_lines = vim.o.lines

  local target_width = math.floor(total_cols * target_width_percent)
  local target_height = math.floor(total_lines * target_height_percent)

  local current_win_id = vim.api.nvim_get_current_win()
  local win_ids = vim.api.nvim_list_wins()

  for _, win_id in ipairs(win_ids) do
    if win_id == current_win_id then
      -- Current window
      vim.api.nvim_set_win_width(win_id, target_width)
      vim.api.nvim_set_win_height(win_id, target_height)
    else
      -- Other windows (reset to equal size)
      vim.api.nvim_win_hide(win_id) -- Briefly hide to force redistribution
      vim.api.nvim_win_show(win_id)
    end
  end
end

local function reset_all_window_sizes()
    local win_ids = vim.api.nvim_list_wins()
    for _, win_id in ipairs(win_ids) do
        vim.api.nvim_win_hide(win_id) -- Briefly hide to force redistribution
        vim.api.nvim_win_show(win_id)
    end
end

-- Function to toggle the feature and reset window sizes
local function toggle_dynamic_window_resize()
    vim.g.enable_dynamic_window_resize = not vim.g.enable_dynamic_window_resize
    if not vim.g.enable_dynamic_window_resize then
        -- Reset window sizes when disabling the feature
        reset_all_window_sizes()
        print("Dynamic window resize disabled")
    else
        print("Dynamic window resize enabled")
        -- Trigger a resize immediately after enabling
        adjust_window_size()
    end
end

-- Optional: Create a command to toggle the feature
vim.api.nvim_create_user_command('ToggleDynamicWindowResize', toggle_dynamic_window_resize, {})

-- Optional: Map a key to toggle the feature (example with <leader>W)
vim.keymap.set('n', '<leader>W', ':ToggleDynamicWindowResize<CR>', { desc = 'Toggle Dynamic Window Resize' })

vim.api.nvim_create_autocmd("WinEnter", {
  callback = adjust_window_size,
})
