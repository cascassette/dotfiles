local splitwise = require("splitwise")

splitwise.setup({
  --max_columns = 2,                 -- per current row
  --max_rows = 2,                    -- per current column
  --resize_step_cols = 5,            -- :vertical resize +N at left/right edge
  --resize_step_rows = 3,            -- :resize +N at top/bottom edge
  create_default_keymaps = false,    -- install <C-h/j/k/l>
  --wrap_navigation = false,         -- wrap to opposite edge when blocked
  --ignore_filetypes = { "help", "qf" },
  --ignore_buftypes = { "nofile", "terminal", "prompt" },
  --new_split_opens_blank_buffer = false, -- duplicate current buffer by default
  --ignore_winfixwidth = false,      -- allow resize even if window has 'winfixwidth'
  --auto_resize_enabled = true,      -- automatically resize focused window
  auto_resize_ratio = 0.6,           -- target ratio for focused window (~65% golden ratio)
})

vim.keymap.set("n", "<C-n>", splitwise.move_right, { desc = "Splitwise move right" })
vim.keymap.set("n", "<C-h>", splitwise.move_left,  { desc = "Splitwise move left" })
vim.keymap.set("n", "<C-c>", splitwise.move_up,    { desc = "Splitwise move up" })
vim.keymap.set("n", "<C-t>", splitwise.move_down,  { desc = "Splitwise move down" })
