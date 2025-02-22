return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    -- 更新版本后，配置方式改变
    -- "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      -- autotag = {
      --   enable = true,
      -- },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader><space>",
          node_incremental = "<leader><space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

-- return {
--   "nvim-treesitter/nvim-treesitter",
--   dependencies = {
--     "nvim-treesitter/playground",
--     "nvim-treesitter/nvim-treesitter-textobjects",
--   },
--   main = "nvim-treesitter.configs",
--   build = ":TSUpdate",
--   opts = {
--     ensure_installed = {
--       "json",
--       "python",
--       "javascript",
--       "typescript",
--       "tsx",
--       "yaml",
--       "html",
--       "css",
--       "markdown",
--       "markdown_inline",
--       "svelte",
--       "graphql",
--       "bash",
--       "lua",
--       "vim",
--       "dockerfile",
--       "gitignore",
--     },
--     highlight = {
--       enable = true,
--     },
--     indent = {
--       enable = true,
--     },
--     playground = {
--       enable = true,
--     },
--     textobjects = {
--       select = {
--         enable = true,
--
--         -- Automatically jump forward to textobj, similar to targets.vim
--         lookahead = true,
--
--         keymaps = {
--           -- You can use the capture groups defined in textobjects.scm
--           ["af"] = "@function.outer",
--           ["if"] = "@function.inner",
--           ["ac"] = "@class.outer",
--           -- You can optionally set descriptions to the mappings (used in the desc parameter of
--           -- nvim_buf_set_keymap) which plugins like which-key display
--           ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--           -- You can also use captures from other query groups like `locals.scm`
--           ["a<CR>"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
--         },
--         -- You can choose the select mode (default is charwise 'v')
--         --
--         -- Can also be a function which gets passed a table with the keys
--         -- * query_string: eg '@function.inner'
--         -- * method: eg 'v' or 'o'
--         -- and should return the mode ('v', 'V', or '<c-v>') or a table
--         -- mapping query_strings to modes.
--         selection_modes = {
--           ["@parameter.outer"] = "v", -- charwise
--           ["@function.outer"] = "V", -- linewise
--           ["@class.outer"] = "<c-v>", -- blockwise
--         },
--         -- If you set this to `true` (default is `false`) then any textobject is
--         -- extended to include preceding or succeeding whitespace. Succeeding
--         -- whitespace has priority in order to act similarly to eg the built-in
--         -- `ap`.
--         --
--         -- Can also be a function which gets passed a table with the keys
--         -- * query_string: eg '@function.inner'
--         -- * selection_mode: eg 'v'
--         -- and should return true of false
--         include_surrounding_whitespace = false,
--       },
--     },
--   },
-- }
