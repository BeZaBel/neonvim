-- ┏━━━━━━━━━━━━━━━┓
-- ┃ G E N E R A L ┃
-- ┗━━━━━━━━━━━━━━━┛

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.o
local wopt = vim.wo

-- Highlight on search
opt.hlsearch = true

-- Linenumbers
wopt.number = true
wopt.relativenumber = true

-- Ensure mouse is enabled
opt.mouse = "a"

-- Cursor line and column
opt.cursorline = true
-- opt.cursorcolumn = true

-- Sync clipboard with sysmtem
opt.clipboard = "unnamedplus"

-- Enable break indent
opt.breakindent = true

-- Signcolumn
wopt.signcolumn = "yes"

-- Update revovery a second after last typing
opt.updatetime = 1000

-- Simple completion options
opt.completeopt = "menuone,noselect"

-- Colors!
opt.termguicolors = true
opt.colorcolumn = "80"

-- Tabs
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true

-- Timeout
opt.timeout = true
opt.timeoutlen = 300

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Vim conceal level
opt.conceallevel = 2

-- opt.list = true
wopt.listchars = "eol:⮠"

-- opt.winbar = "%=%m %f"

-- Neovide settings
opt.guifont = "Iosevka NF:h12"

vim.g.neovide_scroll_animation_length = 0.06
vim.g.neovide_cursor_animation_length = 0.1
