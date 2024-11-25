return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "folke/todo-comments.nvim",
  },
  keys = {
    {
      "<leader>/",
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
    },
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "文件查找" },
    { "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "文本查找" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "查找光标下的文字" },
    { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "帮助文档查找" },
    { "<leader>fp", "<cmd>lua require('telescope.builtin').builtin()<cr>", desc = "查找功能目录查找" },
    { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", desc = "标记查找" }, -- m 开启标记：例：ma 此处标记为 a
    { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "查找之前关闭的文件" },
    { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "查找快捷键" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
    {
      "<leader>fb",
      "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>",
      desc = "查找当前的buffer",
    },
    -- { "<leader>qf", "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
    -- { '<c-p>', "<cmd>lua require('telescope.builtin').commands()<cr>" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "查看所有commit列表" },
    { "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", desc = "查看当前文件commit列表" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "查看所有分支" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "查看使用diff预览列出每个文件的当前更改" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
