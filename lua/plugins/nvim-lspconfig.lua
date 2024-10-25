local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs

local config = function()
    require("neoconf").setup({})

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        vim.env.VIMRUNTIME,
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.stdpath("config") .. "/lua",
                    },
                },
            },
        },
    })

    -- perl
    lspconfig.perlnavigator.setup({
        cmd = { "perlnavigator" },
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "perl" },
        settings = {
            perlnavigator = {
                perltidyProfile = "/Users/ptfse-jake/.config/nvim/.perltidyrc",
                perltidyEnabled = true,
                perlcriticProfile = "",
                perlcriticEnabled = true,
            },
        },
    })

    -- c/cpp
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
            "clangd",
            "--offset-encoding=utf-16",
        },
        filetypes = { "c", "cpp" },
    })

    -- php
    lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "php" },
    })

    -- json
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "json", "jsonc" },
    })

    -- yaml
    lspconfig.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "yaml" },
    })

    -- typescript
    lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    })

    -- bash
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "sh", "aliasrc" },
    })

    -- typescriptreact, javascriptreact, css, sass, scss, less, vue
    lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "typescriptreact",
            "javascriptreact",
            "javascript",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
            "vue",
            "html",
        },
    })

    -- docker
    lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local eslint = require("efmls-configs.linters.eslint")
    local prettier_d = require("efmls-configs.formatters.prettier_d")
    local fixjson = require("efmls-configs.formatters.fixjson")
    local shellcheck = require("efmls-configs.linters.shellcheck")
    local shfmt = require("efmls-configs.formatters.shfmt")
    local taplo = require("efmls-configs.formatters.taplo")
    local hadolint = require("efmls-configs.linters.hadolint")
    local cpplint = require("efmls-configs.linters.cpplint")
    local clangformat = require("efmls-configs.formatters.clang_format")
    local phpstan = require("efmls-configs.linters.phpstan")
    local phpcbf = require("efmls-configs.formatters.phpcbf")

    -- configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "lua",
            "json",
            "jsonc",
            "yaml",
            "toml",
            "sh",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "markdown",
            "docker",
            "html",
            "css",
            "scss",
            "less",
            "c",
            "cpp",
            "php",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
                typescript = { eslint, prettier_d },
                json = { eslint, fixjson },
                jsonc = { eslint, fixjson },
                toml = { taplo },
                sh = { shellcheck, shfmt },
                javascript = { eslint, prettier_d },
                javascriptreact = { eslint, prettier_d },
                typescriptreact = { eslint, prettier_d },
                vue = { eslint, prettier_d },
                markdown = { prettier_d },
                docker = { hadolint, prettier_d },
                html = { prettier_d },
                css = { prettier_d },
                scss = { prettier_d },
                less = { prettier_d },
                c = { clangformat, cpplint },
                cpp = { clangformat, cpplint },
                php = { phpstan, phpcbf },
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
    },
}
