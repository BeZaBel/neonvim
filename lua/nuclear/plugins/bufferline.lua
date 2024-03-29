return {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
        { "<leader><C-p>", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
        { "<C-A-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer to the right" },
        { "<C-A-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer to the left" },
        { "<C-A-j>", "<cmd>BufferLineCycleNext<cr>", desc = "Cycle buffer to the right" },
        { "<C-A-k>", "<cmd>BufferLineCyclePrev<cr>", desc = "Cycle buffer to the left" },
    },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                themable = true,
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                diagnostics = "nvim_lsp",
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 25,
                max_prefix_lenght = 15,
                truncate_names = false,
                tab_size = 20,
                color_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true,
                persist_buffer_sort = true,
                separator_style = "thick",
                enforce_regular_tabs = true,
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File explorer",
                        text_align = "center",
                        highlight = "Directory",
                        separator = true,
                    },
                },
                sort_by = "insert_at_end",
                -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
            },
        })
    end,
}
