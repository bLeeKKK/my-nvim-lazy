---@type LazySpec
return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}

    vim.o.autoread = true -- Required for `opts.events.reload`

    local map = vim.keymap.set

    -- Recommended/example keymaps
    map({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "向 opencode 询问当前选区或光标内容" })

    map({ "n", "x" }, "<leader>ox", function()
      require("opencode").select()
    end, { desc = "打开 opencode 操作菜单" })

    map("n", "<leader>oo", function()
      require("opencode").toggle()
    end, { desc = "切换 opencode 终端窗口" })

    -- operator 用法：在可视模式下将选区内容发送给 opencode
    map({ "n", "x" }, "go", function()
      return require("opencode").operator("@this ")
    end, { desc = "将选区范围添加到 opencode", expr = true })
    map({ "n", "x" }, "goo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "将当前行添加到 opencode", expr = true })

    map("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "Scroll opencode up" })
    map("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "Scroll opencode down" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    map("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    map("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
