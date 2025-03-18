function MoveBufferToNewTab()
  -- Get the current buffer, line, and column position
  local current_buf = vim.api.nvim_get_current_buf()
  local current_pos = vim.api.nvim_win_get_cursor(0) -- {line, column}

  -- Get the buffer name to easily reference it
  local buf_name = vim.fn.bufname(current_buf)

  -- Open a new tab and switch to the buffer
  vim.cmd("tabnew %")

  -- Restore the cursor position in the new tab
  vim.api.nvim_win_set_cursor(0, current_pos)
end
