return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Aggiungi un messaggio di notifica per verificare che questa configurazione venga caricata
    vim.notify("Caricando la configurazione di Treesitter...", vim.log.levels.INFO)
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      vim.notify("nvim-treesitter non trovato!", vim.log.levels.ERROR)
      return
    end
    configs.setup {
      ensure_installed = { "php", "html", "javascript", "lua", "css" },
      sync_install = false,
      auto_install = true,
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["at"] = "@tag.outer",
            ["it"] = "@tag.inner",
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
         },
        },
       }
    -- Verifica che la configurazione sia stata applicata
    vim.notify("Configurazione di Treesitter completata!", vim.log.levels.INFO)
  end,
  dependencies = {
    -- Aggiungi la dipendenza a nvim-treesitter-textobjects se stai usando textobjects
    "nvim-treesitter/nvim-treesitter-textobjects",
  }
}
