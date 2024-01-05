return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                timeout = 300,
                top_down = true,
            },
        },
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            routes = {
                {
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
            },
        })
        require("notify").setup({
            background_colour = "#1e1e2e",
        })
    end,
}
