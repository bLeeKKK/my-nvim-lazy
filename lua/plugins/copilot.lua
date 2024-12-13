return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },

      -- 配置node版本
      copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.18.1/bin/node", -- Node.js version must be > 18.x
    })
  end,
}
