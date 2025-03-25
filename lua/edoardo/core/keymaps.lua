vim.keymap.set('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })

-- esc from search
vim.keymap.set({"i","v","s"}, "jk","<esc>",{noremap=true})

vim.keymap.set("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true, desc = "Buffer successivo" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true, desc = "Buffer precedente" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true, desc = "Buffer precedente" })


-- Move Normal mode (n) e Visual mode (v)
-- vim.keymap.set({"n", "v"}, "k", "k", { noremap = true, silent = true, desc = "Sposta a sinistra" }) -- ←
-- vim.keymap.set({"n", "v"}, "j", "h", { noremap = true, silent = true, desc = "Sposta in basso" })   -- ↓
-- vim.keymap.set({"n", "v"}, "m", "j", { noremap = true, silent = true, desc = "Sposta in alto" })    -- ↑
-- vim.keymap.set({"n", "v"}, "l", "l", { noremap = true, silent = true, desc = "Sposta a destra" })   -- →
