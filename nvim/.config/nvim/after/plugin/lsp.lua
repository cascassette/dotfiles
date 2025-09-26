vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
  callback = function()
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set('n', '<leader>?', vim.lsp.buf.hover, { desc = "LSP hover definition" })
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = "LSP open float" })
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, { desc = "List code actions" })
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, { desc = "Find references" })
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set('n', '<leader>dh', vim.diagnostic.hide, { desc = "Hide diagnostics" })

    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace symbol" })
    --vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, { desc = "Function signature help" })
  end,
})
