local config = function()
    require("lualine").setup({
        options = {
            theme = auto,
            globalstatus = true,
        },
        tabline = {
            lualine_a = {
                "mode"
            },
            lualine_b = {
                "buffers"
            },
            lualine_x = { 
                "encoding",
                {
                    "fileformat",
                    symbols = {
                        unix = 'LF', -- e712
                        dos = 'CRLF',  -- e70f
                        mac = 'CR',  -- e711
                    }
                },
                "filetype"
            },
            lualine_y = {
                "progress"
            },
            lualine_z = {
                "location"
            },
        },
        sections = {},
    })
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = config,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
