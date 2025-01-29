-- Opening Explore in netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Mappings to Esc (<C-c> needs to be remapped due to Visual Block edits)
vim.keymap.set({ "i", "v" }, "fd", "<Esc>", { noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<C-c>", "<Esc>", { noremap = true })

-- Making Ctrl+Backspace useful (should probably get used to NOT using this)
-- Instead, should use normal mode + vim motions, going back to normal mode after insertions.
vim.keymap.set({ "i" }, "<C-h>", "<C-w>", { noremap = true })

-- No highlight after serach
vim.keymap.set("n", "<leader>hl", ":nohlsearch<CR>")

-- Move Highlighted Text Up and Down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle during PgUp and PgDn
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle during search terms
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Paste without losing the current paste buffer (delete into void register)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Paste from the system clipboard
vim.keymap.set("n", "<leader>ps", "\"+p")
vim.keymap.set("x", "<leader>ps", "\"+p")

-- Yank into + register (system clipboard)
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Delete into void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Open different project (<tmux-leader>L to go back to Last tmux session)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Replace current word in file
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")

-- Setting execution permissions
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

