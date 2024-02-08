return {
    {
        "jalvesaq/nvim-r",
        dependencies = { "jalvesaq/cmp-nvim-r" },
        ft = "r",
        config = function()
            vim.g.R_app = "radian"
            vim.g.R_cmd = "R"
            vim.g.R_hl_term = 0
            vim.g.R_bracketed_paste = 1
        end,
    },
}
