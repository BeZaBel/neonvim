return { -- Indent blankline
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    main = "ibl",
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowOrange",
            "RainbowYellow",
            "RainbowGreen",
            "RainbowBlue",
            "RainbowCyan",
            "RainbowViolet",
        }

        -- local carbon = require("oxocarbon").oxocarbon
        local mocha = require("catppuccin.palettes").get_palette "mocha"
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = mocha.red })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = mocha.peach })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = mocha.yellow })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = mocha.green })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = mocha.sky })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = mocha.blue })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = mocha.mauve })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup({ scope = { highlight = highlight } })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        require("ibl").setup({
            enabled = true,
            indent = {
                char = "┊",
                smart_indent_cap = true,
                priority = 2,
            },
            scope = {
                enabled = true,
                include = {
                    node_type = {
                        ["*"] = {
                            "argument_list",
                            "arguments",
                            "assignment_statement",
                            "Block",
                            "chunk",
                            "class",
                            "ContainerDecl",
                            "dictionary",
                            "do_block",
                            "do_statement",
                            "element",
                            "except",
                            "FnCallArguments",
                            "for",
                            "for_statement",
                            "function",
                            "function_declaration",
                            "function_definition",
                            "if_statement",
                            "IfExpr",
                            "IfStatement",
                            "import",
                            "InitList",
                            "list_literal",
                            "method",
                            "object",
                            "ParamDeclList",
                            "repeat_statement",
                            "selector",
                            "SwitchExpr",
                            "table",
                            "table_constructor",
                            "try",
                            "tuple",
                            "type",
                            "var",
                            "while",
                            "while_statement",
                            "with",
                        },
                    },
                },
                highlight = highlight,
            },
        })
    end,
}
