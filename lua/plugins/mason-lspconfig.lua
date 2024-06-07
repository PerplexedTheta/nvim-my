local opts = {
    ensure_installed = {
        "efm",
        "perlnavigator",
        "clangd",
        "intelephense",
        "java_language_server",
        "jsonls",
        "yamlls",
        "tsserver",
        "bashls",
        "emmet_ls",
    },

    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
