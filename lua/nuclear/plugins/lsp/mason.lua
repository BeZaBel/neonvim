return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        local mason = require("mason")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- If a new server is added as default, remember to add its config in
        -- lspconfig.lua
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "rust_analyzer",
                "marksman",
                "lua_ls",
                "texlab",
                "ltex",
                "r_language_server",
            },
            automatic_installation = true,
        })

        local mason_tool_installer = require("mason-tool-installer")
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
            },
        })
    end,
}
