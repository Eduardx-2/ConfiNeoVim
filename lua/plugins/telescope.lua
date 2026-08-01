return {
  {
    "nvim-telescope/telescope.nvim",
    -- Usamos la rama principal sin fijar tag para mantener compatibilidad con Neovim 0.11+
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local builtin = require("telescope.builtin")

      -- Atajos principales
      vim.keymap.set({"i", "n"}, "<leader>ff", builtin.find_files, { desc = "Buscar archivos" }) -- la n representa la navegación por defecto
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscar texto en proyecto" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Ver buffers abiertos" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Buscar ayuda" })

      -- Configuración de UI
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", "target/", "__pycache__/" },
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
    end,
  },
}
