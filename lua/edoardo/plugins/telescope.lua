-- plugins/telescope.lua
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
        local keymap = vim.keymap.set

        -- Funzione buffer personalizzata
        local custom_buffers = function(opts)
            opts = opts or {}
            opts.attach_mappings = function(prompt_bufnr, map)
                local delete_buf = function()
                    local selection = action_state.get_selected_entry()
                    if selection then
                        actions.close(prompt_bufnr)
                        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                    end
                end
                map('i', '<c-u>', delete_buf)
                return true
            end
            opts.previewer = false
            
            builtin.buffers(require('telescope.themes').get_dropdown(opts))
        end

        -- Keymaps
        keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        keymap('n', '<leader>fb', custom_buffers, { desc = 'Telescope custom buffers' })  -- Usa la funzione personalizzata
        keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        
        -- Oppure aggiungi una mappatura separata per la funzione personalizzata
        keymap('n', '<leader>fB', custom_buffers, { desc = 'Telescope buffers with delete' })
    end,
}
