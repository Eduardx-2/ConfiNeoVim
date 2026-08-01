return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        -- Tabla de grupos adicionales a limpiar (por si alguna ventana queda opaca)
        extra_groups = {
          "NormalFloat", -- Ventanas flotantes del LSP/diagnósticos
          "FloatBorder", -- Bordes de ventanas flotantes
          "SignColumn",   -- Columna de números/git
        },
      })
    end,
  },
}
