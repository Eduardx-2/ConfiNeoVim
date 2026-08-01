return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local config = require("nvim-treesitter.config")

      config.setup({
        -- Lista de lenguajes cuyos parsers se instalarán automáticamente
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "python",
          "rust",
          "java",
          "c",
          "html",
          "css",
          "json",
          "bash",
          "markdown",
          "markdown_inline",
        },

        -- Instala automáticamente el parser si abres un archivo de un lenguaje no instalado
        auto_install = true,

        -- Habilita el resaltado de sintaxis avanzado
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- Habilita el sangrado (indentación) inteligente basado en el árbol sintáctico
        indent = {
          enable = true,
        },
      })
    end,
  },
}
