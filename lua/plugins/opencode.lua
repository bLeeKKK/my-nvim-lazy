---@type LazySpec
return {
  "NickvanDyke/opencode.nvim",
  version = "*", -- 安装最新稳定版
  dependencies = {
    {
      -- 推荐集成 `snacks.nvim`，但不是必须
      ---@module "snacks" <- 加载 `snacks.nvim` 类型，提供配置补全提示
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- 增强 `ask()` 体验
        picker = { -- 增强 `select()` 体验
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
    -- 👇 这就是 opencode.nvim 的配置点
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- 在这里填你的自定义配置（看 README 或类型定义）
      -- 例如 server 启动命令、自定义 prompts、contexts 等
      server = {
        -- start = function()
        --   local cmd = "opencode serve --port 4096"
        --   require("opencode.terminal").open(cmd, {
        --     win = { position = "bottom", enter = false },
        --   })
        -- end,
        -- stop = function()
        --   require("opencode").stop()
        -- end,
        -- toggle = function()
        --   require("opencode").toggle()
        -- end,
      },
      -- contexts = { ... },
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
      -- ask = { ... },
      -- select = { ... },
      -- lsp = { enabled = true, ... },
      -- events = { enabled = true, ... },
    }

    -- 需要 autoread 才能正确处理外部修改
    vim.o.autoread = true

    -- 👇 推荐的快捷键（可改成你喜欢的布局）
    local map = vim.keymap.set
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

    -- 滚动 opencode 窗口
    -- map("n", "<S-C-u>", function()
    --   require("opencode").command("session.half.page.up")
    -- end, { desc = "向上滚动 opencode 窗口" })
    -- map("n", "<S-C-d>", function()
    --   require("opencode").command("session.half.page.down")
    -- end, { desc = "向下滚动 opencode 窗口" })

    -- map("n", "+", "<C-a>", { desc = "增加光标下的数值", noremap = true })
    -- map("n", "-", "<C-x>", { desc = "减少光标下的数值", noremap = true })
  end,
}
