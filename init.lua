-- vim.loader.enable()
if vim.g.vscode then
  -- VSCode extension
else
  require("config.lazy")

  -- 基础配置
  require("core.options")
  require("core.keymaps")
  require("core.im-select")
end
