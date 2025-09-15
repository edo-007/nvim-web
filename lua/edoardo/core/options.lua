vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Line Numbers
vim.wo.number = true


vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

function ShowTreselectionHelp()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, {
    "Treesitter Selection Guide:",
    "─────────────────────────",
    "gnn  │ Inizia selezione",
    "grn  │ Espandi al nodo",
    "grc  │ Espandi allo scope",
    "grm  │ Riduci selezione",
    "af     @function.outer",
    "if     @function.inner",
    "at     @tag.outer",
    "it     @tag.inner",
  })
  local width = 30
  local height = 10
  local opts = {
    relative = "cursor",
    width = width,
    height = height,
    col = 0,
    row = 1,
    style = "minimal",
    border = "rounded"
  }
  local win = vim.api.nvim_open_win(buf, false, opts)
  vim.defer_fn(function() vim.api.nvim_win_close(win, true) end, 4000)
end

-- Associa a un comando
vim.api.nvim_create_user_command("TsHelp", ShowTreselectionHelp, {})
-- Oppure a una scorciatoia
vim.keymap.set("n", "<leader>th", ShowTreselectionHelp, {desc = "Mostra aiuto Treesitter"})
