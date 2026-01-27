return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- Caricalo all'avvio
    priority = 1000, -- Assicurati che venga caricato prima degli altri
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
