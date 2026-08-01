return {
  "neovim/nvim-lspconfig",
  ft = { "python" },
  config = function()
    -- Configuración de Ruff con la nueva API nativa
    vim.lsp.config("ruff", {
      init_options = {
        settings = {
          args = {},
        },
      },
      on_attach = function(client, bufnr)
        -- Desactivar hoverProvider para evitar popups duplicados con Pyright/Basedpyright
        client.server_capabilities.hoverProvider = false

        -- Mapeo para formatear el buffer actual
        vim.keymap.set("n", "<leader>fm", function()
          vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = "Formatear archivo con Ruff" })
      end,
    })

    -- Activar el servidor LSP para Ruff
    vim.lsp.enable("ruff")
  end,
}
