return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Versión recomendada para Neovim >= 0.10
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          -- 1. Activar Inlay Hints automáticamente al abrir archivos Rust
          if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          -- 2. Mapeo local al buffer para alternarlos (Toggle con <leader>th)
          vim.keymap.set("n", "<leader>th", function()
            local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
            vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
          end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              bindingModeHints = { enable = false },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true, minLines = 25 },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "never" },
              typeHints = { enable = true },
            },
          },
        },
      },
    }
  end,
}
