return {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function ()
        require('nvim-surround').setup({
            surrounds = {
                ["{"] = {
                    add = { "{", "}" },
                    find = function()
                        return get_selection({ motion = "a{" })
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["}"] = {
                    add = { "{", "}" },
                    find = function()
                        return get_selection({ motion = "a}" })
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["("] = {
                    add = { "(", ")" },
                    find = function()
                        return get_selection({ motion = "a(" })
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                [")"] = {
                    add = { "(", ")" },
                    find = function()
                        return get_selection({ motion = "a)" })
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["["] = {
                    add = { "[", "]" },
                    find = function()
                        return get_selection({ motion = "a[" })
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["]"] = {
                    add = { "[", "]" },
                    find = function()
                        return get_selection({ motion = "a]" })
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["¿"] = {
                    add = { "¿", "?" },
                    find = function()
                        return get_selection({ motion = "a¿" })
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["?"] = {
                    add = { "¿", "?" },
                    find = function()
                        return get_selection({ motion = "a?" })
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["¡"] = {
                    add = { "¡", "!" },
                    find = function()
                        return get_selection({ motion = "a¡" })
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["!"] = {
                    add = { "¡", "!" },
                    find = function()
                        return get_selection({ motion = "a!" })
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["<"] = {
                    add = { "<", ">" },
                    find = function()
                        return get_selection({ motion = "a<" })
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                [">"] = {
                    add = { "<", ">" },
                    find = function()
                        return get_selection({ motion = "a>" })
                    end,
                    delete = "^(.)().-(.)()$",
                },
            },
        })
    end
}
