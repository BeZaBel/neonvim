return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {},
    config = function()
        local wk = require('which-key')
        wk.register({
            ['<leader>c'] = { name = '[C]hange', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = '[D]elete', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]omment', _ = 'which_key_ignore' },
            ['<leader>h'] = { name = '[H]elp', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]hange character', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            ['<leader>f'] = { name = '[F]ile operations', _ = 'which_key_ignore' },
            ['<leader>o'] = { name = '[O]ther commands', _ = 'which_key_ignore' },
            ['<leader>e'] = { name = 'T[E]lescope and shit', _ = 'which_key_ignore' },
        })
    end
}
