-- set leader key to space
vim.g.mapleader = " "

-- local opts = { noremap = true, silent = true }
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- 保存
keymap.set("i", "<C-s>", "<ESC>:w<CR>")
keymap.set("n", "<C-s>", ":w<CR>")

-- 使用 jk, jj 退出编辑模式
keymap.set("i", "jk", "<ESC>", { desc = "退出 insert 模式" })
keymap.set("i", "jj", "<ESC>", { desc = "退出 insert 模式" })

-- 清楚搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 使用x删除，不放到剪切板
keymap.set("n", "x", '"_x')

-- 使用p粘贴的时候，不把覆盖的文字粘贴到剪贴板
keymap.set("v", "p", '"_dP')

-- Key mappings --
-- keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
-- keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
-- keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
-- keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

-- 清理cl进入插入模式
-- keymap.set({ "n", "i", "v" }, "cl", "<Nop>")

-- keymap.set("n", "<C-b>n", ":BufferLineCycleNext<CR>")
keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>")
-- keymap.set("n", "<C-b>p", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>")
-- keymap.set('n', '<C-w>', '<Nop>', { noremap = true, silent = true }) -- 取消默认<C-w>
--
keymap.set("n", "<C-w>", ":Bdelete<CR>", { nowait = true }) -- 关闭当前buf
keymap.set("n", "<leader>wo", ":BufferLineCloseOthers<CR>", { desc = "关闭其他buffer" }) -- 关闭其他
keymap.set("n", "<leader>wx", ":Bdelete<CR>", { desc = "关闭当前buffer" }) -- 关闭其他
keymap.set("n", "<leader>wa", ":bufdo :Bdelete<CR>", { desc = "关闭全部buffer" }) -- 关闭其他

-- keymap.set("n", "<C-o>", ":BufferLineCloseOthers<CR>") -- 关闭其他
keymap.set("n", "<leader>p", ":BufferLinePick<CR>") -- pick切换
keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>") -- 跳转到窗口1
keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>") -- 跳转到窗口2
keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>") -- 跳转到窗口3
keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>") -- 跳转到窗口4
keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>") -- 跳转到窗口5
keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>") -- 跳转到窗口6
keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>") -- 跳转到窗口7
keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>") -- 跳转到窗口8
keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>") -- 跳转到窗口9

keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "垂直拆分窗口" }) -- 打开横向窗口
keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "水平拆分窗口" }) -- 打开竖向窗口
keymap.set("n", "<leader>se", "<C-w>=", { desc = "分割的大小相等" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "关闭当前窗口" }) -- close current split window
keymap.set("n", "<C-q>", "<Cmd>q<CR>", { desc = "关闭当前窗口" }) -- 关闭窗口

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "打开新的Tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "关闭当前Tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "下一个Tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "上一个Tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "在新Tab中打开当前的buffer" }) --  move current buffer to new tab

keymap.set("n", "<C-t>c", ":tabnew<CR>") -- open new tab
keymap.set("n", "<C-t>q", ":tabclose<CR>") -- close current tab
keymap.set("n", "<C-t>n", ":tabn<CR>") --  go to next tab
keymap.set("n", "<C-t>p", ":tabp<CR>") --  go to previous tab

-- 移动代码
-- Normal-mode commands: 上下左右移动代码
keymap.set("n", "<S-j>", ":MoveLine(1)<CR>")
keymap.set("n", "<S-k>", ":MoveLine(-1)<CR>")
-- keymap.set("n", "<S-h>", ":MoveHChar(-1)<CR>", )
-- keymap.set("n", "<S-l>", ":MoveHChar(1)<CR>", )
-- keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>")
-- keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>")
-- Visual-mode commands: 上下左右移动代码块
keymap.set("v", "<S-j>", ":MoveBlock(1)<CR>")
keymap.set("v", "<S-k>", ":MoveBlock(-1)<CR>")
-- keymap.set("v", "<S-h>", ":MoveHBlock(-1)<CR>", )
-- keymap.set("v", "<S-l>", ":MoveHBlock(1)<CR>", )

-- 调整窗口大小
keymap.set("n", "<A-Up>", ":resize +2<CR>")
keymap.set("n", "<A-Down>", ":resize -2<CR>")
keymap.set("n", "<A-Left>", ":vertical resize +2<CR>")

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>") -- toggle file explorer
-- keymap.set("n", "<leader>o", ":NvimTreeToggle<CR>") -- toggle file explorer

keymap.set("n", "<A-Right>", ":vertical resize -2<CR>")
keymap.set({ "v", "n" }, "<leader>y", '"+y')
