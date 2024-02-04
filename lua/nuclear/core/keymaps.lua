-- ┏━━━━━━━━━━━━━━━┓
-- ┃ K E Y M A P S ┃
-- ┗━━━━━━━━━━━━━━━┛

-- Plugin keymaps are configured in their corresponding plugin file

local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<NOP>", { silent = true })

-- File operations
map("n", "<leader>fs", vim.cmd.w, { desc = "Save file" })
map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit" })
map("n", "<leader>fsq", vim.cmd.wq, { desc = "Save and quit" })
map("n", "<leader>fss", ":w ", { desc = "Save as" })
--

-- Ask for help!
map("n", "<leader>H", ":h ", { desc = "Help" })

-- Splits
map("n", "<leader>wv", vim.cmd.new, { desc = "New buffer on horizontal split" })
map("n", "<leader>ws", vim.cmd.vnew, { desc = "New buffer on vertical split" })
map("n", "<leader>wn", vim.cmd.enew, { desc = "New buffer" })

-- Buffer operations
map({ "n", "v" }, "<leader>W", vim.cmd.bd, { desc = "Close current buffer" })

-- Movement
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffer management
-- map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
-- map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })
-- map("n", "<C-A-w>", "<cmd>bd<cr>", { desc = "Move to next buffer" })
