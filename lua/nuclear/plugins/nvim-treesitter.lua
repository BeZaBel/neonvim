return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
    config = function()
        local treesitter = require('nvim-treesitter.configs')
        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },
            ensure_installed = {
                'c',
                'cpp',
                'lua',
                'python',
                'css',
                'yaml',
                'html',
                'rust',
                'vimdoc',
                'vim',
                'bash',
                'markdown',
                'markdown_inline',
                'latex',
                'regex'
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
        })
    end,
}
