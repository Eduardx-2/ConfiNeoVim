return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Desactivar el explorador por defecto de Vim (netrw) esta desactivado por defecro, pero por si se cuela.
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 25,
          relativenumber = false, -- Por defecto esta desactivado, pero usted puede activarlo remplazando "false" por "true".
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false, -- Muestra archivos ocultos (como .gitignore, .env)
        },
      })

      -- Atajo de teclado para abrir y cerrar el explorador
      vim.keymap.set({"n", "i"}, "<leader>b", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar explorador de archivos" })
      vim.keymap.set({"n", "i"}, "<leader>bc", "<cmd>NvimTreeFindFile<CR>", { desc = "Revelar archivo actual en el árbol" })
    end,
  },
}
