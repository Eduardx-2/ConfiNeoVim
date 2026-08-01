-- Silenciar la advertencia de transición interna de nvim-lspconfig en Neovim 0.11+
vim.g.lspconfig_suppress_deprecation_warning = true

return {
  -- Gestor de binarios y servidores
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Instalador automático sin handlers legacy
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "rust_analyzer", "omnisharp" },
        automatic_installation = true,
      })
    end,
  },

  -- Configuración de servidores con la API nativa vim.lsp.config (Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configuración global (aplica capacidades de autocompletado a todos los LSPs)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- 1. Servidor de Python (Pyright)
      vim.lsp.config("pyright", {})
      vim.lsp.enable("pyright")

      -- 2. Servidor de Rust (Rust Analyzer)
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      -- 3. Servidor de C# (OmniSharp)
      vim.lsp.config("omnisharp", {
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      })
      vim.lsp.enable("omnisharp")

      -- Keymaps del LSP (se activan automáticamente al conectar un servidor al buffer)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })

      -- Autocompletado pop-up (nvim-cmp)
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }),
      })
    end,
  },
}
