local permission_hlgroups = {
    ["-"] = "NonText",
    ["r"] = "DiagnosticSignWarn",
    ["w"] = "DiagnosticSignError",
    ["x"] = "DiagnosticSignOk",
}

return {
    "stevearc/oil.nvim",
    keys = {
        {
            "<leader>l",
            function()
                require("oil").open()
            end,
            desc = "Oil!",
        },
    },
    config = function()
        require("oil").setup({
            columns = {
                {
                    "permissions",
                    highlight = function(permission_str)
                        local hls = {}
                        for i = 1, #permission_str do
                            local char = permission_str:sub(i, i)
                            table.insert(hls, { permission_hlgroups[char], i - 1, i })
                        end
                        return hls
                    end,
                },
                { "size", highlight = "Special" },
                { "mtime", highlight = "Number" },
                {
                    "icon",
                    default_file = icon_file,
                    directory = icon_dir,
                    add_padding = true,
                },
            },
            view_options = {
                show_hidden = true,
            },
        })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
