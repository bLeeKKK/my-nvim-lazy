return {
  {
    -- jk高速移动
    "rhysd/accelerated-jk",
    config = function()
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
    end,
  },
  {
    -- 打开上次关闭的时候页面上的 buf
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup()
      vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
      vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
      vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
    end
  },
  {
    -- 自动补全括号
    "windwp/nvim-autopairs",
    opts = {
      enable_check_bracket_line = false,
    },
  },
  {
    -- 打开文件的时候自动跳转到上次光标最后所在位置
    "ethanholz/nvim-lastplace",
    config = true,
  },
  {
    -- 快速跳跃
    "folke/flash.nvim",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
    --   config = function()
    --     require("flash").setup()
    --     vim.keymap.set({ "n", "x", "o" }, "s",
    --       function()
    --         require("flash").jump({
    --           search = {
    --             mode = function(str)
    --               return "\\<" .. str
    --             end,
    --           },
    --         })
    --       end
    --     )
    --     vim.keymap.set({ "n", "x", "o" }, "S",
    --       function()
    --         require("flash").treesitter()
    --       end
    --     )
    --     vim.keymap.set({ "o" }, "r",
    --       function()
    --         require("flash").remote()
    --       end
    --     )
    --     vim.keymap.set({ "o", "x" }, "R",
    --       function()
    --         require("flash").treesitter_search()
    --       end
    --     )
    --   end,
  },
  {
    -- 检查驼峰命名
    "kamykn/spelunker.vim",
    config = function()
      vim.g.spelunker_check_type = 2
    end
  },
  {
    -- markdown预览工具
    "ellisonleao/glow.nvim",
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])


      -- configure nvim-tree
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        -- change folder arrow icons
        renderer = {
          root_folder_modifier = ":t",
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        view = {
          -- float = {
          --   enable = true,
          -- },
          width = 30,
          side = "right",
          -- mappings = {
          --   list = {
          --     { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
          --     { key = "h", cb = tree_cb("close_node") },
          --     { key = "v", cb = tree_cb("vsplit") },
          --   },
          -- },
        },
        git = {
          ignore = false,
        },
      })

      -- open nvim-tree on setup

      local function open_nvim_tree(data)
        -- buffer is a [No Name]
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not no_name and not directory then
          return
        end

        -- change to the directory
        if directory then
          vim.cmd.cd(data.file)
        end

        -- open the tree
        require("nvim-tree.api").tree.open()
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end
  },
  -- {
  --   -- 文件管理器
  --   "nvim-neo-tree/neo-tree.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     require("neo-tree").setup()
  --     vim.keymap.set({ "n", "v" }, "<leader>e", [[<cmd>Neotree toggle<CR>]])
  --   end
  -- },
  {
    -- 快捷键提示
    "folke/which-key.nvim",
    config = true,
  },
  {
    -- 增强vim的编辑功能
    'echasnovski/mini.ai',
    config = true,
  },
  {
    "echasnovski/mini.comment",
    config = true,
  },
  {
    -- nvim 窗口功能优化
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = true,
          bo = {
            filetype = { "fidget", "neo-tree" }
          }
        }
      })
      vim.keymap.set("n",
        "<c-w>p",
        function()
          local window_number = require('window-picker').pick_window()
          if window_number then vim.api.nvim_set_current_win(window_number) end
        end
      )
    end
  },
  {
    -- 窗口滚动更加平滑
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
    end,
  },
  {
    -- 多选多光标编辑
    'mg979/vim-visual-multi',
  },
  {
    -- 整行上下移动
    'fedepujol/move.nvim',
    opts = {
      line = {
        enable = true, -- Enables line movement
        indent = true  -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true  -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = false -- Enables char movement
      }
    }
  },
  {
    -- 选中文本后高亮闪烁
    "ibhagwan/smartyank.nvim",
    opts = {
      highlight = {
        enabled = true,        -- highlight yanked text
        higroup = "IncSearch", -- highlight group of yanked text
        timeout = 300,         -- timeout for clearing the highlight
      },
      clipboard = {
        enabled = true,
      },
      tmux = {
        enabled = true,
        -- remove `-w` to disable copy to host client's clipboard
        cmd = { "tmux", "set-buffer", "-w" },
      },
      osc52 = {
        enabled = true,
        -- escseq = 'tmux',     -- use tmux escape sequence, only enable if
        -- you're using tmux and have issues (see #4)
        ssh_only = true,       -- false to OSC52 yank also in local sessions
        silent = false,        -- true to disable the "n chars copied" echo
        echo_hl = "Directory", -- highlight group of the OSC52 echo message
      },
      -- By default copy is only triggered by "intentional yanks" where the
      -- user initiated a `y` motion (e.g. `yy`, `yiw`, etc). Set to `false`
      -- if you wish to copy indiscriminately:
      -- validate_yank = false,
      --
      -- For advanced customization set to a lua function returning a boolean
      -- for example, the default condition is:
      -- validate_yank = function() return vim.v.operator == "y" end,
    }
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = true,        -- "Name" codes like Blue or blue
        RRGGBBAA = false,    -- #RRGGBBAA hex codes
        AARRGGBB = false,    -- 0xAARRGGBB hex codes
        rgb_fn = false,      -- CSS rgb() and rgba() functions
        hsl_fn = false,      -- CSS hsl() and hsla() functions
        css = false,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true,                                -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    }
  }
}
