return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  keys = {
    { '<leader>?',       "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
    { "<leader><space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
    { "<leader>/",
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end
    },
    { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "文件查找" },
    { '<leader>fw', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "文本查找" },
    { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "帮助文档查找" },
    { '<leader>fp', "<cmd>lua require('telescope.builtin').builtin()<cr>", desc = "查找功能目录查找" },
    { '<leader>fm', "<cmd>lua require('telescope.builtin').marks()<cr>" },
    { '<leader>qf', "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
    { '<leader>km', "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
    { '<c-p>', "<cmd>lua require('telescope.builtin').commands()<cr>" },
    { '<leader>gc', "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
  end
}
