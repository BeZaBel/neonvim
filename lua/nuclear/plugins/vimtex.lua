return {
    "lervag/vimtex",
    ft = "tex",
    config = function()
        vim.g.vimtex_view_general_viewer = "zathura"
        vim.g.vimtex_compiler_method = "tectonic"
        vim.g.tex_conceal = "abdmgs"
        vim.g.vimtex_syntax_enabled = 0
        vim.g.vimtex_syntax_conceal_enabled = 0
    end,
}
