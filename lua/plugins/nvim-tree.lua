return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local nvimtree = require("nvim-tree")

      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      nvimtree.setup({
        view = {
          width = 35,
          relativenumber = true,
        },
        -- change folder arrow icons
        renderer = {
          indent_markers = {
            enable = true,
          },
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
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
        filters = {
          custom = { ".DS_Store" },
        },
        git = {
          ignore = false,
        },
      })

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "打开资源管理器" }) -- toggle file explorer
      keymap.set(
        "n",
        "<leader>ef",
        "<cmd>NvimTreeFindFile<CR>",
        { desc = "当前文件在文件资源管理器显示" }
      ) -- toggle file explorer on current file
      keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "折叠文件资源管理器" }) -- collapse file explorer
      keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "刷新文件浏览器" }) -- refresh file explorer
    end,
  },
}