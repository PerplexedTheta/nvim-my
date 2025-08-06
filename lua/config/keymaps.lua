local keymap = require("util.keymapper").keymap

-- Buffer formatting
vim.keymap.set("n", "<leader>bf", function()
    require("conform").format({ async = true }) -- run onform
end)

-- Buffer Navigation
keymap("<leader>bn", "bnext", "n") -- Next buffer
keymap("<leader>bp", "bprevious", "n") -- Prev buffer
keymap("<leader>bd", "bdelete", "n") -- Delete buffer
keymap("<leader>nv", "vnew", "n") -- New buffer
keymap("<leader>hn", "new", "n") -- New buffer, vertically
keymap("<leader>bb", "e #", "n") -- Switch to Other Buffer
keymap("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigation
keymap("<leader>tf", "NvimTreeFocus", "n")
keymap("<leader>tt", "NvimTreeToggle", "n")

-- Pane and Window Navigation
keymap("<S-Up>", "wincmd k", "n") -- Navigate Up
keymap("<S-Right>", "wincmd l", "n") -- Navigate Right
keymap("<S-Down>", "wincmd j", "n") -- Navigate Down
keymap("<S-Left>", "wincmd h", "n") -- Navigate Left

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
