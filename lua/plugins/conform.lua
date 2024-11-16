-- 格式化工具，目前使用时只能格式化，无法启用lint。暂时舍弃

return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          -- python = { "isort", "black" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          -- rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          javascript = { "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
        },
      })

      -- 然后你可以像使用vim.lsp.buf.format（）一样使用conform.format（）。例如，要在保存时格式化：
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          conform.format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
