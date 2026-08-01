return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    completion = {
      cmp = { enabled = true }, -- Integra sugerencias directas con nvim-cmp
    },
    popup = {
      autofocus = true,
      border = "rounded",
    },
  },
  config = function(_, opts)
    local crates = require("crates")
    crates.setup(opts)

    -- Mapeos útiles únicamente dentro de archivos Cargo.toml
    vim.api.nvim_create_autocmd("BufRead", {
      pattern = "Cargo.toml",
      callback = function(event)
        local opts_buf = { buffer = event.buf, silent = true }

        -- Ver versiones disponibles y actualizar
        vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, vim.tbl_extend("force", opts_buf, { desc = "Ver versiones de la Crate" }))
        vim.keymap.set("n", "<leader>cf", crates.show_features_popup, vim.tbl_extend("force", opts_buf, { desc = "Ver Features" }))
        vim.keymap.set("n", "<leader>cu", crates.update_crate, vim.tbl_extend("force", opts_buf, { desc = "Actualizar Crate (respetando semver)" }))
        vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, vim.tbl_extend("force", opts_buf, { desc = "Upgrade a la versión más reciente" }))
        vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, vim.tbl_extend("force", opts_buf, { desc = "Ver Dependencias de la Crate" }))
      end,
    })
  end,
}
