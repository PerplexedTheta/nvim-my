return {
    "maxmx03/solarized.nvim",
    lazy = false,
    opts = {
        palette = "solarized", -- solarized (default) | selenized
        variant = "winter", -- "spring" | "summer" | "autumn" | "winter" (default)
    },
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.cmd.colorscheme "solarized"
        require("solarized").setup(opts)
    end,
}
