return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        integrations = {
            bufferline = true,
            markdown = true,
            mason = true,
            cmp = true,
            nvimtree = true,
            treesitter = true,
            telescope = {
                enabled = true,
            },
            noice = true,
            -- fidget = true,
            indent_blankline = {
                enabled = true,
                scope_color = "flamingo",
                colored_indent_levels = true,
            },
            rainbow_delimiters = true,
            which_key = true,
        },
        transparent_background = true,
        term_colors = true,
        styles = {
            comments = { "italics" },
            conditionals = { "italics" },
        },
    },
    config = function()
        vim.cmd([[colorscheme catppuccin]])
    end,
}
