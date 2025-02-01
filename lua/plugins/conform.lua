-- 格式化工具，这里使用时只能格式化，无法启用lint

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        vue = { "prettier", "eslint_d" },
        javascript = { "prettier", "eslint_d" },
        typescript = { "prettier", "eslint_d" },
        javascriptreact = { "prettier", "eslint_d" },
        typescriptreact = { "prettier", "eslint_d" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

-- return {
--   {
--     "stevearc/conform.nvim",
--     config = function()
--       local conform = require("conform")
--       conform.setup({
--         formatters_by_ft = {
--           lua = { "stylua" },
--           -- Conform will run multiple formatters sequentially
--           -- python = { "isort", "black" },
--           -- You can customize some of the format options for the filetype (:help conform.format)
--           -- rust = { "rustfmt", lsp_format = "fallback" },
--           -- Conform will run the first available formatter
--           javascript = { "prettier" },
--           typescriptreact = { "prettierd", "prettier" },
--           javascriptreact = { "prettierd", "prettier" },
--         },
--       })
--
--       -- 然后你可以像使用vim.lsp.buf.format（）一样使用conform.format（）。例如，要在保存时格式化：
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         pattern = "*",
--         callback = function(args)
--           conform.format({ bufnr = args.buf })
--         end,
--       })
--     end,
--   },
-- }
