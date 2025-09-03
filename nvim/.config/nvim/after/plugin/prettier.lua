vim.api.nvim_create_autocmd({ "BufWritePre" }, {
   pattern = { "*.js", "*.jsx", "*.mjs", "*.ts", "*.tsx", "*.css", "*.less", "*.scss", "*.json", "*.graphql", "*.md", "*.vue", "*.svelte" },
   command = "PrettierAsync"
})
--vim.g.prettier.exec_cmd_path = "~/path/to/cli/prettier"
--vim.g.prettier.config.config_precedence = "prefer-file"
vim.cmd("let g:prettier#config#config_precedence='prefer-file'")
