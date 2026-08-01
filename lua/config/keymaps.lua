vim.g.mapleader = " " --La tecla padre es space (espacio), pero la puedes cambiar
local map = vim.keymap.set

--- Remapear Ctrl+Z para deshacer (Undo) en todos los modos
vim.keymap.set("n", "<C-z>", "u", { desc = "Deshacer cambios" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Deshacer cambios" })
vim.keymap.set("v", "<C-z>", "<Esc>u", { desc = "Deshacer cambios" })


--Explorador integrado netrw
--map({"n", "i"}, "bc", vim.cmd.Ex, { desc = "Explorador de archivos" })
