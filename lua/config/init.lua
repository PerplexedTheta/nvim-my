-- -- init lazy.nvim -- --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- -- init globals -- --
require("config.globals")
require("config.opts")
require("config.keymaps")
require("config.autocmds")

-- -- init config -- --
local opts = {
    defaults = {
        lazy = false,
    },
    install = {
        colorscheme = { "catpuccin" },
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrw",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
    change_detection = {
        notify = true,
    },
}

require("lazy").setup("plugins", opts)
