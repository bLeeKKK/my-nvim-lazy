local opt = vim.opt -- 为了简洁

vim.g.copilot_proxy = "127.0.0.1:7890" -- vim.env.HTTPS_PROXY 或 vim.env.HTTP_PROXY
print("Copilot代理：" .. vim.g.copilot_proxy)

-- Lua 初始化文件
vim.g.nightflyTransparent = true

-- 行号
opt.relativenumber = true -- 显示相对行号
opt.number = true -- 在光标行显示绝对行号（当相对行号启用时）

-- 制表符和缩进
-- opt.wtabstop = 2 -- 2 个空格表示制表符（prettier 默认）
opt.shiftwidth = 2 -- 2 个空格表示缩进宽度
opt.expandtab = true -- 将制表符扩展为空格
opt.autoindent = true -- 开始新行时从当前行复制缩进

-- 行换行
opt.wrap = false -- 禁用行换行

-- 搜索设置
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 如果搜索中包含混合大小写，则假定您需要区分大小写

-- 光标行
opt.cursorline = true -- 高亮当前光标行

-- 外观

-- 启用 termguicolors 以使 nightfly 配色方案生效
--（必须使用 iterm2 或其他真彩色终端）
opt.termguicolors = true
-- opt.background = "light" -- 配色方案可以是浅色或深色，将被设置为深色
opt.signcolumn = "yes" -- 显示标志列，防止文本移动

-- 退格键
opt.backspace = "indent,eol,start" -- 允许在缩进、行尾或插入模式起始位置使用退格键

-- 剪贴板
opt.clipboard:append("unnamedplus") -- 使用系统剪贴板作为默认寄存器

-- 分割窗口
opt.splitright = true -- 垂直窗口向右分割
opt.splitbelow = true -- 水平窗口向下分割

opt.iskeyword:append("-") -- 将 string-string 视为完整单词

-- opt.list = true -- 启用空白字符可视化
-- opt.listchars:append("space:⋅") -- 设置空格显示为点
-- opt.listchars:append("trail:·") -- 设置行尾多余空格显示为点

-- 定义匹配的字符对
-- vim.o.matchpairs = vim.o.matchpairs .. ",<:>"
-- opt.matchpairs:append("<:>")
-- vim.g.matchup_matchparen_offscreen = {}
-- vim.g.matchup_matchparen_deferred = {}
-- -- 启用 % 键在匹配的字符对之间跳转
-- vim.cmd([[
-- autocmd FileType * setlocal matchpairs+=%:
-- ]])
-- lvim.builtin.treesitter.matchup.enable = true

local _lazygit = nil
_G._toggle_lazygit = function()
  if vim.fn.executable("lazygit") then
    if not _lazygit then
      _lazygit = require("toggleterm.terminal").Terminal:new({
        cmd = "lazygit",
        direction = "float",
        close_on_exit = true,
        hidden = true,

        float_opts = {
          border = "double",
        },
      })
    end
    _lazygit:toggle()
  else
    vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
  end
end

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }

  -- vim.keymap.set("t", "jk", [[<C-`><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
