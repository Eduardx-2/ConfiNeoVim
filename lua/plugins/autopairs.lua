return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Se carga justo cuando entras al modo Insertar
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true, -- Usa Treesitter para no autocompletar símbolos dentro de comentarios o strings
        ts_config = {
          lua = { "string" }, -- No añade pares dentro de strings en Lua
          javascript = { "template_string" },
        },
      })

      -- Integración con nvim-cmp:
      -- Si seleccionas una función en el menú flotante y das Enter, añade los () automáticamente
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
