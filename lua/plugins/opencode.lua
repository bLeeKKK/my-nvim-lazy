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
    -- Set required environment variable for opencode authentication
    -- vim.env.OPENCODE_SERVER_PASSWORD = "0p9o8i7u6y"

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        port = nil,
        start = function()
          require("opencode.terminal").open("opencode --port", {
            split = "right",
            width = math.floor(vim.o.columns * 0.75),
          })
        end,
        stop = function()
          require("opencode.terminal").close()
        end,
        toggle = function()
          require("opencode.terminal").toggle("opencode --port", {
            split = "right",
            width = math.floor(vim.o.columns * 0.75),
          })
        end,
      },
      prompts = {
        diagnostics = { prompt = "解释 @diagnostics", submit = true },
        diff = { prompt = "请审查下面的 git diff，检查其正确性与可读性：@diff", submit = true },
        document = { prompt = "为 @this 添加说明注释", submit = true },
        explain = { prompt = "解释 @this 及其上下文", submit = true },
        fix = { prompt = "修复 @diagnostics", submit = true },
        implement = { prompt = "实现 @this", submit = true },
        optimize = { prompt = "优化 @this 的性能与可读性", submit = true },
        review = { prompt = "审查 @this 的正确性与可读性", submit = true },
        test = { prompt = "为 @this 添加测试", submit = true },
      },
    }

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
