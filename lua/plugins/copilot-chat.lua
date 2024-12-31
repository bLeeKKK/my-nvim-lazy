return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      proxy = "127.0.0.1:1087",
      -- See Configuration section for options
      highlight_headers = false,
      separator = "---",
      error_header = "> [!ERROR] Error",

      contexts = {
        frontend_dev = {
          input = function(callback)
            vim.ui.select({ "react", "vue", "angular", "svelte" }, {
              prompt = "选择一个前端框架> ",
            }, callback)
          end,
          resolve = function(input)
            input = input or "react"
            local config

            if input == "react" then
              config =
                "React：使用 Create React App 或 Vite 创建一个新项目。安装必要的依赖项，如 React Router、Redux 和 TailwindCSS。"
            elseif input == "vue" then
              config =
                "Vue：使用 Vue CLI 或 Vite 初始化一个项目。包括像 Vue Router、Vuex 和可选的 TailwindCSS 等库。"
            elseif input == "angular" then
              config =
                "Angular：使用 Angular CLI 搭建一个新项目。可以考虑添加 Angular Material 或 Bootstrap 进行样式设计。"
            elseif input == "svelte" then
              config =
                "Svelte：从 SvelteKit 或 Svelte 仓库中的模板开始。可以选择添加 TailwindCSS 进行样式设计。"
            end

            return {
              {
                content = config,
                filename = input .. "_setup_guide",
                filetype = "text",
              },
            }
          end,
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
    --
  },
}
