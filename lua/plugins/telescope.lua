local keymap = require("util.keymapper").keymap

local config = function()
    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
                hidden = true,
            },
            live_grep = {
                theme = "dropdown",
                previewer = false,
            },
            buffers = {
                theme = "dropdown",
                previewer = false,
            },
        },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config,
    keys = {
        keymap("<leader>fk", "Telescope keymaps", "n"),
        keymap("<leader>fh", "Telescope help_tags", "n"),
        keymap("<leader>ff", "Telescope find_files", "n"),
        keymap("<leader>fg", "Telescope live_grep", "n"),
        keymap("<leader>fb", "Telescope buffers", "n"),
    },
}
