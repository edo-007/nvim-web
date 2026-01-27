return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
        local keymap = vim.keymap.set

        -- QUESTA È LA PARTE CRUCIALE PER DISATTIVARE TUTTO
        telescope.setup({
            defaults = {
                previewer = false,      -- Disabilita la preview ovunque
                layout_strategy = 'vertical', -- Opzionale: layout più compatto
                layout_config = {
                    width = 0.5,        -- La finestra occuperà solo metà schermo
                    height = 0.4,       -- E sarà più bassa
                },
            },
        })

        -- Funzione buffer personalizzata (mantiene le tue logiche)
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
                -- Nota: qui nel tuo codice mancava il tasto, ho messo <C-d> come esempio
                map('i', '<C-d>', delete_buf) 
                return true
            end
            
            -- Qui forziamo il tema dropdown che è il RE del minimalismo senza preview
            builtin.buffers(require('telescope.themes').get_dropdown(opts))
        end

        -- Keymaps
        -- Ora ff, fg, fh useranno tutti i "defaults" (niente preview)
        keymap('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
        keymap('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
        keymap('n', 'fb', custom_buffers, { desc = 'Telescope custom buffers' })
        keymap('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
}
