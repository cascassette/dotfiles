--require('lspconfig').lua_ls.setup()

--[[
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
})
]]

--[[
lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-space>'] = cmp.mapping.complete(),
  })
})
]]

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
  callback = function()
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover), { desc = "LSP hover definition" } -- key collides with ouroboros 'alternate file' cmd
    -- vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = "LSP open float" })
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, { desc = "List code actions" })
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, { desc = "Find references" })
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set('n', '<leader>dh', vim.diagnostic.hide, { desc = "Hide diagnostics" })

    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace symbol" })
    --vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, { desc = "Function signature help" })
  end,
})
