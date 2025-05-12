return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "LSP-显示引用"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "LSP-去到定义处"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "LSP-展示定义处"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "LSP-去到实现处"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "LSP-查看类型定义"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "LSP-尝试修复"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "LSP-智能重命名"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "LSP-显示缓冲区诊断"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "LSP-显示行诊断"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "LSP-转到之前的诊断"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "LSP-转到下一个诊断"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "LSP-显示光标下内容的文档"
        keymap.set("n", "gK", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "LSP-重置lsp"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- mason_lspconfig.setup_handlers({
    --   -- default handler for installed servers
    --   function(server_name)
    --     lspconfig[server_name].setup({
    --       capabilities = capabilities,
    --     })
    --   end,
    --   ["svelte"] = function()
    --     -- configure svelte server
    --     lspconfig["svelte"].setup({
    --       capabilities = capabilities,
    --       on_attach = function(client, bufnr)
    --         vim.api.nvim_create_autocmd("BufWritePost", {
    --           pattern = { "*.js", "*.ts" },
    --           callback = function(ctx)
    --             -- Here use ctx.match instead of ctx.file
    --             client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
    --           end,
    --         })
    --       end,
    --     })
    --   end,
    --   ["graphql"] = function()
    --     -- configure graphql language server
    --     lspconfig["graphql"].setup({
    --       capabilities = capabilities,
    --       filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    --     })
    --   end,
    --   ["emmet_ls"] = function()
    --     -- configure emmet language server
    --     lspconfig["emmet_ls"].setup({
    --       capabilities = capabilities,
    --       filetypes = {
    --         -- "html",
    --         -- "typescriptreact",
    --         -- "javascriptreact",
    --         "css",
    --         "sass",
    --         "scss",
    --         "less",
    --         "svelte",
    --       },
    --     })
    --   end,
    --   ["lua_ls"] = function()
    --     -- configure lua server (with special settings)
    --     lspconfig["lua_ls"].setup({
    --       capabilities = capabilities,
    --       settings = {
    --         Lua = {
    --           -- make the language server recognize "vim" global
    --           diagnostics = {
    --             globals = { "vim" },
    --           },
    --           completion = {
    --             callSnippet = "Replace",
    --           },
    --         },
    --       },
    --     })
    --   end,
    --   ["rust_analyzer"] = function()
    --     -- Rust Analyzer 配置
    --     lspconfig["rust_analyzer"].setup({
    --       capabilities = capabilities,
    --       settings = {
    --         ["rust-analyzer"] = {
    --           cargo = {
    --             allFeatures = true, -- 启用所有的 Cargo 功能
    --           },
    --           checkOnSave = {
    --             command = "clippy", -- 保存时运行 Clippy 检查
    --           },
    --           diagnostics = {
    --             disabled = { "inactive-code" }, -- 关闭某些诊断
    --           },
    --         },
    --       },
    --       -- on_attach = function(client, bufnr)
    --       --   -- 设置快捷键或其他初始化逻辑
    --       --   local opts = { noremap = true, silent = true, buffer = bufnr }
    --       --   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --       --   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    --       --   vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    --       -- end,
    --     })
    --   end,
    -- })
  end,
}
