vim.api.nvim_create_autocmd({ "BufWritePre" }, {
   pattern = { "*.js", "*.jsx", "*.mjs", "*.ts", "*.tsx", "*.css", "*.less", "*.scss", "*.json", "*.graphql", "*.md", "*.vue", "*.svelte" },
   command = "PrettierAsync"
})
--vim.g.prettier.exec_cmd_path = "~/path/to/cli/prettier"
