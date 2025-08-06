local config = function()
    local masonToolInstaller = require("mason-tool-installer")

    masonToolInstaller.setup({
        ensure_installed = {
            "bashls",
            "dockerls",
            "emmet_ls",
            "intelephense",
            "jsonls",
            "lua_ls",
            "pylsp",
            "pyright",
            "ts_ls",
            "yamlls",
        },
        run_on_start = true,
    })
end

return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = config,
    lazy = false,
}
