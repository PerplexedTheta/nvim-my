return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = {
        filters = {
            dotfiles = false,
        },
        git = {
            ignore = false,
        },
        view ={
            side = 'right',
        },
    },
}
