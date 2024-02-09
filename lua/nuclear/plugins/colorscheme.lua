return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local flavour = "mocha" -- mocha, latte, frappe or macchiato
            local carbon = require("oxocarbon").oxocarbon
            local colors = require("catppuccin.palettes").get_palette(flavour)
            require("catppuccin").setup({
                flavour = flavour,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                term_colors = true,
                transparent_background = false,
                color_overrides = {
                    latte = {
                        crust = "#f4f4f4",
                        base = "#ffffff",
                    },
                    mocha = {
                        base = "#161616",
                        mantle = "#262626",
                        crust = "#393939",
                    },
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    telescope = {
                        enabled = false,
                    },
                    noice = true,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "flamingo",
                        colored_indent_levels = true,
                    },
                    rainbow_delimiters = true,
                    which_key = true,
                    bufferline = true,
                    markdown = true,
                    mason = true,
                    headlines = true,
                },
                highlight_overrides = {
                    latte = function()
                        return {
                            TelescopeNormal = { bg = carbon.base05, fg = colors.text },
                            TelescopePromptBorder = { bg = carbon.base04, fg = carbon.base04 },
                            TelescopePromptNormal = { bg = carbon.base04, fg = carbon.base00 },
                            TelescopePromptPrefix = { bg = carbon.base04, fg = colors.text },
                            TelescopeResultsBorder = { bg = carbon.base05, fg = carbon.base05 },
                            TelescopeResultsTitle = { bg = carbon.base05, fg = colors.text },
                            TelescopeSelection = { bg = carbon.base03, fg = colors.base },
                            TelescopePreviewBorder = { bg = carbon.base06, fg = carbon.base06 },
                            TelescopePreviewTitle = { bg = carbon.base06, fg = colors.text },
                            TelescopePreviewNormal = { bg = carbon.base06, fg = carbon.base03 },
                        }
                    end,
                    macchiato = function()
                        return {
                            TelescopeNormal = { bg = carbon.base01, fg = colors.text },
                            TelescopePromptBorder = { bg = carbon.base00, fg = carbon.base00 },
                            TelescopePromptNormal = { bg = carbon.base00, fg = carbon.base00 },
                            TelescopePromptPrefix = { bg = carbon.base00, fg = colors.text },
                            TelescopeResultsBorder = { bg = carbon.base01, fg = carbon.base01 },
                            TelescopeResultsTitle = { bg = carbon.base01, fg = colors.text },
                            TelescopeSelection = { bg = carbon.base03, fg = colors.text },
                            TelescopePreviewBorder = { bg = carbon.base02, fg = carbon.base02 },
                            TelescopePreviewTitle = { bg = carbon.base02, fg = colors.text },
                            TelescopePreviewNormal = { bg = carbon.base02, fg = carbon.base03 },
                        }
                    end,
                    frappe = function()
                        return {
                            TelescopeNormal = { bg = carbon.base01, fg = colors.text },
                            TelescopePromptBorder = { bg = carbon.base00, fg = carbon.base00 },
                            TelescopePromptNormal = { bg = carbon.base00, fg = carbon.base00 },
                            TelescopePromptPrefix = { bg = carbon.base00, fg = colors.text },
                            TelescopeResultsBorder = { bg = carbon.base01, fg = carbon.base01 },
                            TelescopeResultsTitle = { bg = carbon.base01, fg = colors.text },
                            TelescopeSelection = { bg = carbon.base03, fg = colors.text },
                            TelescopePreviewBorder = { bg = carbon.base02, fg = carbon.base02 },
                            TelescopePreviewTitle = { bg = carbon.base02, fg = colors.text },
                            TelescopePreviewNormal = { bg = carbon.base02, fg = carbon.base03 },
                        }
                    end,
                    mocha = function()
                        return {
                            TelescopeNormal = { bg = carbon.base01, fg = colors.text },
                            TelescopePromptBorder = { bg = carbon.base00, fg = carbon.base00 },
                            TelescopePromptNormal = { bg = carbon.base00, fg = colors.text },
                            TelescopePromptPrefix = { bg = carbon.base00, fg = colors.text },
                            TelescopeResultsBorder = { bg = carbon.base01, fg = carbon.base01 },
                            TelescopeResultsTitle = { bg = carbon.base01, fg = colors.text },
                            TelescopeSelection = { bg = carbon.base03, fg = colors.text },
                            TelescopePreviewBorder = { bg = carbon.base02, fg = carbon.base02 },
                            TelescopePreviewTitle = { bg = carbon.base02, fg = colors.text },
                            TelescopePreviewNormal = { bg = carbon.base02, fg = carbon.base03 },
                        }
                    end,
                },
            })
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}
