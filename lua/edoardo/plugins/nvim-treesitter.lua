eturn {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "php", "html", "javascript", "lua", "css" }, -- e altri linguaggi
      highlight = { enable = true },
     indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@funcion.outer",
            ["if"] = "@function.inner",
            ["at"] = "@tag.outer",
            ["it"] = "@tag.inner",
          },
        },
      },
    }
 end
}

