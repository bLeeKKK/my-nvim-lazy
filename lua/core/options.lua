local opt = vim.opt                    -- for conciseness

vim.g.copilot_proxy = "127.0.0.1:1087" -- vim.env.HTTPS_PROXY or vim.env.HTTP_PROXY
print("Copilot代理：" .. vim.g.copilot_proxy)

-- Lua initialization file
vim.g.nightflyTransparent = true

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
-- opt.wtabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true     -- split vertical window to the right
opt.splitbelow = true     -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- 定义匹配的字符对
-- vim.o.matchpairs = vim.o.matchpairs .. ",<:>"
-- opt.matchpairs:append("<:>")
-- vim.g.matchup_matchparen_offscreen = {}
-- vim.g.matchup_matchparen_deferred = {}
-- -- 启用 % 键在匹配的字符对之间跳转
-- vim.cmd([[
--   autocmd FileType * setlocal matchpairs+=%:
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
