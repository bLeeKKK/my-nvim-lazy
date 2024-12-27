return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    -- local keymap = vim.keymap -- for conciseness

    vim.keymap.set("n", "s", substitute.operator, { desc = "替换运动" })
    vim.keymap.set("n", "S", substitute.eol, { desc = "替换行尾" })
    vim.keymap.set("n", "ss", substitute.line, { desc = "替换整行" })
    vim.keymap.set("x", "s", substitute.visual, { desc = "查看模式替换" })
  end,
}
