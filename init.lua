-- vim.loader.enable()
if vim.g.vscode then
-- VSCode 扩展
else
  require("config.lazy")

  -- 基础配置
  require("core.options")
  require("core.keymaps")
  require("core.im-select")
end

-- 获取当前时间
