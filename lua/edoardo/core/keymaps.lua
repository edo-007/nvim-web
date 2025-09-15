vim.keymap.set('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })

-- esc from search
vim.keymap.set({"i","v","s"}, "jk","<esc>",{noremap=true})

vim.keymap.set("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true, desc = "Buffer successivo" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true, desc = "Buffer precedente" })


vim.keymap.set('n', '<CR>', 'm`o<Esc>``')


-- chiusura buffers

vim.api.nvim_create_user_command('Wbw', 'w | bw', {})
vim.api.nvim_create_user_command('Wbd', 'w | bd', {}) 

 vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('config/telescope').my_buffer()<cr>", {noremap = true})
