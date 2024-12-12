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
        cmd = {  },
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "perl" },
        settings = {
            perlnavigator = {
                perlPath = "/usr/bin/perl",
                enableWarnings = true,
                perltidyProfile = vim.env.HOME .. "/.config/nvim/.perltidyrc",
                perlcriticProfile = vim.env.HOME .. ".config/nvim/.perlcriticrc",
                perlcriticEnabled = true,
            },
        },
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
    lspconfig.ts_ls.setup({
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
