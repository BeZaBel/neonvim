return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }
        -- Telescope Integration
        -- Called only when an LSP server connects to a buffer
        local on_attach = function(_, bufnr)
            local telescopecmd = require("telescope.builtin")

            opts.buffer = bufnr
            opts.desc = "Show LSP references"
            map("n", "gr", telescopecmd.lsp_references, opts)
            opts.desc = "Show LSP definitions"
            map("n", "gd", telescopecmd.lsp_definitions, opts)
            opts.desc = "[R]e[n]ame"
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)
            opts.desc = "[C]ode [A]ction"
            map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            opts.desc = "Show LSP implementations"
            map("n", "gI", telescopecmd.lsp_implementations, opts)
            opts.desc = "Show LSP type definitions"
            map("n", "<leader>D", telescopecmd.lsp_type_definitions, opts)
            opts.desc = "Show LSP [D]ocument [S]ymbols"
            map("n", "<leader>ds", telescopecmd.lsp_document_symbols, opts)
            opts.desc = "Show [B]uffer [d]iagnostics"
            map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
            opts.desc = "Show line diagnostics"
            map("n", "<leader>dD", vim.diagnostic.open_float, opts)
            opts.desc = "Go to previous diagnostic"
            map("n", "[d", vim.diagnostic.goto_prev, opts)
            opts.desc = "Go to next diagnostic"
            map("n", "[d", vim.diagnostic.goto_next, opts)
            opts.desc = "Show documentation for what is under cursor"
            map("n", "K", vim.lsp.buf.hover, opts)
            opts.desc = "Signature Documentation"
            map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            opts.desc = "Restart server just in case"
            map("n", "<leader>rs", ":LspRestart<CR>", opts)
            opts.desc = "[G]oto [D]eclaration"
            map("n", "gD", vim.lsp.buf.declaration, opts)
        end

        require("neodev").setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
        -- This mirrors the ensure_installed table in mason.lua,
        -- IF A NEW SERVER CONFIG IS ADDED HERE, ADD IT TO MASON.LUA AS WELL
        local servers = {
            lua_ls = {
                Lua = {
                    telemetry = { enable = false },
                    diagnostics = {
                        globals = { "vim" },
                        disable = { "missing-fields" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
            html = {},
            rust_analyzer = {},
            marksman = {},
            cssls = {},
            r_language_server = {},
            texlab = {
                texlab = {
                    build = {
                        executable = "tectonic",
                        args = { "-X", "compile", "%f" },
                        onSave = true,
                    },
                },
            },
            ltex = {
                ltex = {
                    language = "es",
                    enabled = false,
                },
                filetypes = {
                    "bib",
                    "tex",
                },
            },
        }

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        })
    end,
}
