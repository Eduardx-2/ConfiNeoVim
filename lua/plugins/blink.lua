return {
  'saghen/blink.cmp',
  opts = {
    sources = {
      -- Quita 'crates' de la lista por defecto
      default = { 'lsp', 'path', 'snippets', 'buffer' },

      -- Actívalo únicamente para archivos TOML
      per_filetype = {
        toml = { 'lsp', 'path', 'snippets', 'buffer', 'crates' },
      },

      providers = {
        crates = {
          name = 'crates',
          module = 'crates.outer.blink',
        },
      },
    },
  },
}
