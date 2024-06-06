local keymap = require("util.keymapper").keymap

-- Buffer Navigation
keymap("<leader>bn", "bnext", "n") -- Next buffer
keymap("<leader>bp", "bprevious", "n") -- Prev buffer
keymap("<leader>bb", "e #", "n") -- Switch to Other Buffer
keymap("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigatio}n
keymap("<leader>m", "NvimTreeFocus", "n")
keymap("<leader>f", "NvimTreeToggle", "n")

-- Pane and Window Navigation
keymap("<C-h>", "wincmd h", "n") -- Navigate Left
keymap("<C-j>", "wincmd j", "n") -- Navigate Down
keymap("<C-k>", "wincmd k", "n") -- Navigate Up
keymap("<C-l>", "wincmd l", "n") -- Navigate Right

-- Window Management
keymap("<leader>sv", "vsplit", "n") -- Split Vertically
keymap("<leader>sh", "split", "n") -- Split Horizontally
keymap("<leader>sm", "MaximizerToggle", "n") -- Toggle Minimise

-- Indenting
keymap("<", "v", "<gv") -- Shift Indentation to Left
keymap(">", "v", ">gv") -- Shift Indentation to Right

-- Show Full File-Path
keymap("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
