return {
    "Olical/conjure",
    ft = {
        "lisp",
        "python",
        "scheme",
        -- "rust",
    },
    dependencies = {
        {
            "PaterJason/cmp-conjure",
            config = function()
                local cmp = require("cmp")
                local config = cmp.get_config()
                table.insert(config.sources, {
                    name = "buffer",
                    option = {
                        sources = {
                            { name = "conjure" },
                        },
                    },
                })
                cmp.setup(config)
            end,
        },
    },
    config = function(_, opts)
        require("conjure.main").main()
        require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
        vim.g["conjure#debug"] = true
        vim.g["conjure#extract#tree_sitter#enabled"] = true
    end,
}
