return {
  {
    "yorumicolors/yorumi.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Carga el esquema de colores ESTÁNDAR (Fondo Opaco)
      vim.cmd.colorscheme("yorumi")
    end,
  },
}
