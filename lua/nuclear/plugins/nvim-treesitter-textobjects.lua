return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    config = function()
        require('nvim-treesitter.configs').setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['a='] = '@assignment.outer',
                        ['i='] = '@assignment.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']n'] = '@function.inner',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']N'] = '@function.inner',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[n'] = '@function.inner',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[N'] = '@function.inner',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    }
                },
            },
        })
    end
}
