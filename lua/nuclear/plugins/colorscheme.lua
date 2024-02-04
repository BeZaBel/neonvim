return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme oxocarbon]])
        end,
    },
    -- {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --     require("catppuccin").setup({
    --         flavour = "mocha",
    --         styles = {
    --             comments = { "italic" },
    --             conditionals = { "italic" },
    --         },
    --         term_colors = true,
    --         transparent_background = false,
    --         -- color_overrides = {
    --         --     mocha = {
    --         --         base = "#000000",
    --         --         mantle = "#010101",
    --         --         crust = "#020202",
    --         --     },
    --         -- },
    --         integrations = {
    --             cmp = true,
    --             gitsigns = true,
    --             nvimtree = true,
    --             treesitter = true,
    --             notify = true,
    --             telescope = {
    --                 enabled = true,
    --             },
    --             noice = true,
    --             indent_blankline = {
    --                 enabled = true,
    --                 scope_color = "flamingo",
    --                 colored_indent_levels = true,
    --             },
    --             rainbow_delimiters = true,
    --             which_key = true,
    --             bufferline = true,
    --             markdown = true,
    --             mason = true,
    --             headlines = true,
    --         },
    --     })
    --     vim.cmd([[colorscheme catppuccin]])
    -- end,
    -- },
}
