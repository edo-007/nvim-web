return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local keymap = vim.keymap.set

        -- Funzione buffer personalizzata
        local custom_buffers = function(opts)
            opts = opts or {}
            opts.attach_mappings = function(prompt_bufnr, map)
                -- Usa l'azione integrata 'delete_buffer' di Telescope.
                -- Non chiude la finestra e gestisce le selezioni multiple.
                -- Puoi mappare la scorciatoia che preferisci (es. <C-d> in insert mode e 'dd' in normal mode)
                map('i', '<C-d>', actions.delete_buffer)
                map('n', 'dd', actions.delete_buffer)
                
                return true -- Mantiene le mappature predefinite (come <CR> per aprire il buffer)
            end
            opts.previewer = false
            
            builtin.buffers(require('telescope.themes').get_dropdown(opts))
        end

        -- Keymaps
        keymap('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
        keymap('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
        keymap('n', 'fb', custom_buffers, { desc = 'Telescope custom buffers' })
        keymap('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
}
