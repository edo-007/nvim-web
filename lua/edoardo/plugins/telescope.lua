-- plugins/telescope.lua
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
      
    local builtin = require('telescope.builtin')

    local keymap = vim.keymap.set
    keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
        defaults = {
            mapping = {
                i = {
                    ["C-k"] = actions.move_selection_previous,
                    ["C-m"] = actions.move_selection_next,
                    ["C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
                }
            }
        }
    })

  end,
}
