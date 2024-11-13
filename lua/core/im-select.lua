local M = {}

M.defaultIM = "com.apple.keylayout.ABC"
M.currentIM = M.defaultIM

M.macInsertLeave = function()
  M.currentIM = vim.fn.system({ "im-select" })
  vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
end

M.macInsertEnter = function()
  if M.currentIM then
    vim.cmd(":silent :!im-select" .. " " .. M.currentIM)
  else
    vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
  end
end

M.windowsInsertLeave = function()
  vim.cmd(":silent :!~/.config/nvim/im-select.exe 1033")
end

M.windowsInsertEnter = function()
  vim.cmd(":silent :!~/.config/nvim/im-select.exe 2052")
end

local im_select = function()
  local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true })
  local autocmd = vim.api.nvim_create_autocmd
  -- 自动切换输入法
  autocmd("InsertLeave", {
    group = myAutoGroup,
    callback = M.macInsertLeave,
  })
  autocmd("InsertEnter", {
    group = myAutoGroup,
    callback = M.macInsertEnter,
  })
end

im_select()

-- return M
