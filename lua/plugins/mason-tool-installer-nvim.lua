local config = function()
    local masonToolInstaller = require("mason-tool-installer")

    masonToolInstaller.setup({
        ensure_installed = {
            "bash-language-server",
            "clang-format",
            "clangd",
            "cpplint",
            "css-lsp",
            "efm",
            "emmet-ls",
            "eslint-lsp",
            "fixjson",
            "hadolint",
            "html-lsp",
            "intelephense",
            "java-language-server",
            "json-lsp",
            "lua-language-server",
            "luacheck",
            "perlnavigator",
            "phpcbf",
            "phpstan",
            "prettier",
            "prettierd",
            "shellcheck",
            "shfmt",
            "stylua",
            "taplo",
            "tailwindcss-language-server",
            "typescript-language-server",
            "yaml-language-server",
        },
        run_on_start = true,
    })
end

return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = config,
    lazy = false,
}
