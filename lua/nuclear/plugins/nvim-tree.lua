return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvimtree = require("nvim-tree")
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#94e2d5 ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#94e2d5 ]])
        nvimtree.setup({
            sort_by = "case_sensitive",
            on_attach = "default",
            view = {
                preserve_window_proportions = true,
                width = 27,
                side = "right",
                float = {
                    enable = true,
                    open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = 30,
                        height = 30,
                        row = 1,
                        col = 2,
                    },
                },
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                        },
                    },
                },
            },
            git = {
                enable = true,
            },
            filters = {
                dotfiles = true,
            },
        })
        -- Keymaps
        local map = vim.keymap.set
        map({ "n", "v" }, "<A-b>", function()
            local api = require("nvim-tree.api")
            api.tree.toggle()
        end, { silent = true })

        -- Allow neovim to close if nvim-tree is the only buffer open
        vim.api.nvim_create_autocmd("QuitPre", {
            callback = function()
                local tree_wins = {}
                local floating_wins = {}
                local wins = vim.api.nvim_list_wins()
                for _, w in ipairs(wins) do
                    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                    if bufname:match("NvimTree_") ~= nil then
                        table.insert(tree_wins, w)
                    end
                    if vim.api.nvim_win_get_config(w).relative ~= "" then
                        table.insert(floating_wins, w)
                    end
                end
                if 1 == #wins - #floating_wins - #tree_wins then
                    for _, w in ipairs(tree_wins) do
                        vim.api.nvim_win_close(w, true)
                    end
                end
            end,
        })

        -- require("transparent").clear_prefix("NvimTree_")
    end,
}
