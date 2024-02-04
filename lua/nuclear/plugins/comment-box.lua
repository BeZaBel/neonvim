return {
    "LudoPinelli/comment-box.nvim",
    keys = {
        {
            "<C-A-l>",
            function()
                require("comment-box").line(1)
            end,
            desc = "Make a comment line",
        },
        {
            "<C-A-b>",
            function()
                require("comment-box").llbox(1)
            end,
            desc = "Make a comment box",
        },
    },
}
