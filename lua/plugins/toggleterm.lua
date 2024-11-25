-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<C-f>", "<Cmd>ToggleTerm direction=float<CR>", mode = { "n" }, desc = "打开浮动终端" },
    { "<C-f>", "<Esc><Cmd>ToggleTerm direction=float<CR>", mode = { "i" }, desc = "打开浮动终端" },
    -- { "<C-`>", "<Cmd>ToggleTerm direction=horizontal<CR>", mode = { "t" }, desc = "打开底部终端" },
    {
      "<C-`>",
      -- "<Cmd>ToggleTerm direction=horizontal<CR>"
      function()
        local term_number = vim.v.count > 0 and vim.v.count or 1 -- 如果没有输入数字，默认为 1
        vim.cmd(":" .. term_number .. "ToggleTerm direction=horizontal")
      end,
      mode = { "n" },
      desc = "打开底部终端",
    },
    { "<Esc>", "<C-\\><C-n>", mode = { "t" }, desc = "退出终端模式" },
    { "<Esc><Esc>", "<C-\\><C-n><C-w>q", mode = { "t" }, desc = "关闭终端" },
    { "<leader>gg", ":lua _toggle_lazygit()<CR>", desc = "打开Lazygit" },
  },
  opts = {
    {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.40
        end
      end,
      on_open = function()
        -- Prevent infinite calls from freezing neovim.
        -- Only set these options specific to this terminal buffer.
        vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
        vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
      end,
      -- highlights = {
      --   FloatBorder = {
      --     guifg = floatborder_hl,
      --   },
      -- },
      open_mapping = [[<C-`>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
    },
  },
}
