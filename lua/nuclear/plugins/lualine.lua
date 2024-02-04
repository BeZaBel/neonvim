return {
    "nvim-lualine/lualine.nvim",

    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    config = function()
        local lualine = require("lualine")

            -- Color table for highlights
            -- stylua: ignore
        -- local mocha = require("catppuccin.palettes").get_palette "mocha"
        local carbon = require("oxocarbon").oxocarbon

        local colors = {
            -- bg = mocha.base,
            -- fg = mocha.text,
            -- yellow = mocha.yellow,
            -- cyan = mocha.sky,
            -- darkblue = mocha.blue,
            -- green = mocha.green,
            -- orange = mocha.peach,
            -- violet = mocha.mauve,
            -- magenta = mocha.pink,
            -- blue = mocha.sapphire,
            -- red = mocha.red,
            -- base00 #161616
            -- base01 #262626
            -- base02 #393939
            -- base03 #525252
            -- base04 #d0d0d0
            -- base05 #f2f2f2
            -- base06 #ffffff
            -- base07 #08bdba
            -- base08 #3ddbd9
            -- base09 #78a9ff
            -- base10 #ee5396
            -- base11 #33b1ff
            -- base12 #ff7eb6
            -- base13 #42be65
            -- base14 #be95ff
            -- base15 #82cfff
            color0 = carbon.base00,
            color1 = carbon.base01,
            color2 = carbon.base02,
            color3 = carbon.base03,
            color4 = carbon.base04,
            color5 = carbon.base05,
            color6 = carbon.base06,
            color7 = carbon.base07,
            color8 = carbon.base08,
            color9 = carbon.base09,
            color10 = carbon.base10,
            color11 = carbon.base11,
            color12 = carbon.base12,
            color13 = carbon.base13,
            color14 = carbon.base14,
            color15 = carbon.base15,
            color16 = carbon.base16,
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = "",
                section_separators = "",
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.color0, bg = colors.color5 } },
                    inactive = { c = { fg = colors.color0, bg = colors.color3 } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left({
            function()
                return "▊"
            end,
            color = { fg = colors.color5 }, -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        })

        ins_left({
            -- mode component
            function()
                return ""
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = colors.color0,
                    i = colors.color13,
                    v = colors.color10,
                    [""] = colors.color11,
                    V = colors.color11,
                    c = colors.color12,
                    no = colors.color10,
                    s = colors.color15,
                    S = colors.color15,
                    [""] = colors.color15,
                    ic = colors.color8,
                    R = colors.color14,
                    Rv = colors.color14,
                    cv = colors.color10,
                    ce = colors.color10,
                    r = colors.color8,
                    rm = colors.color8,
                    ["r?"] = colors.color8,
                    ["!"] = colors.color10,
                    t = colors.color10,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        })

        ins_left({
            -- filesize component
            "filesize",
            cond = conditions.buffer_not_empty,
        })

        -- ins_left({
        --     "filename",
        --     cond = conditions.buffer_not_empty,
        --     color = { fg = colors.color3, gui = "bold" },
        -- })

        ins_left({ "location" })

        ins_left({ "progress", color = { fg = colors.color0, gui = "bold" } })

        ins_left({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                color_error = { fg = colors.color10 },
                color_warn = { fg = colors.color14 },
                color_info = { fg = colors.color13 },
            },
        })

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left({
            function()
                return "%="
            end,
        })

        ins_left({
            -- Lsp server name .
            function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = " LSP:",
            color = { fg = "#161616", gui = "bold" },
        })

        -- Add components to right sections
        ins_right({
            "o:encoding", -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.color0, gui = "bold" },
        })

        -- ins_right({
        --     "fileformat",
        --     fmt = string.upper,
        --     icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
        --     color = { fg = colors.color0, gui = "bold" },
        -- })

        ins_right({
            "branch",
            icon = "",
            color = { fg = colors.color1, gui = "bold" },
        })

        ins_right({
            "diff",
            -- Is it me or the symbol for modified us really weird
            symbols = { added = " ", modified = "󰝤 ", removed = " " },
            diff_color = {
                added = { fg = colors.color13 },
                modified = { fg = colors.color12 },
                removed = { fg = colors.color10 },
            },
            cond = conditions.hide_in_width,
        })

        ins_right({
            function()
                return "▊"
            end,
            color = { fg = colors.color5 },
            padding = { left = 1 },
        })

        lualine.setup(config)
    end,

    -- Now don't forget to initialize lualine

    -- opts = {
    --     options = {
    --         icons_enabled = true,
    --         component_separators = "▓",
    --         section_separators = "",
    --         theme = "catppuccin",
    --     },
    -- },
}
