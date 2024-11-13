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
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "jj", "<ESC>")

-- 清楚搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 使用x删除，不放到剪切板
keymap.set("n", "x", '"_x')

-- 使用p粘贴的时候，不把覆盖的文字粘贴到剪贴板
keymap.set("v", "p", '"_dP')

-- Key mappings --
keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

keymap.set("n", "<C-b>n", ":BufferLineCycleNext<CR>")
keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<C-b>p", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-w>", ":Bdelete<CR>")                    -- 关闭当前buf
keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>")      -- 关闭全部
keymap.set("n", "<leader>p", ":BufferLinePick<CR>")             -- pick切换
keymap.set("n", "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>") -- 跳转到窗口1
keymap.set("n", "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>") -- 跳转到窗口2
keymap.set("n", "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>") -- 跳转到窗口3
keymap.set("n", "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>") -- 跳转到窗口4
keymap.set("n", "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>") -- 跳转到窗口5
keymap.set("n", "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>") -- 跳转到窗口6
keymap.set("n", "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>") -- 跳转到窗口7
keymap.set("n", "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>") -- 跳转到窗口8
keymap.set("n", "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>") -- 跳转到窗口9

keymap.set("n", "<leader>wp", "<C-w>p") -- 窗口跳转
keymap.set("n", "<leader>wv", "<C-w>v") -- 打开横向窗口
keymap.set("n", "<leader>ws", "<C-w>s") -- 打开竖向窗口
keymap.set("n", "<C-q>", "<C-w>q") -- 打开竖向窗口

keymap.set("n", "<C-t>c", ":tabnew<CR>")                     -- open new tab
keymap.set("n", "<C-t>q", ":tabclose<CR>")                   -- close current tab
keymap.set("n", "<C-t>n", ":tabn<CR>")                       --  go to next tab
keymap.set("n", "<C-t>p", ":tabp<CR>")                       --  go to previous tab

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
keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")   -- toggle file explorer
keymap.set("n", "<leader>o", ":NvimTreeToggle<CR>") -- toggle file explorer

keymap.set("n", "<A-Right>", ":vertical resize -2<CR>")
keymap.set({ "v", "n" }, "<leader>y", "\"+y")
