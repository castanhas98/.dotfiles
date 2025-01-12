-- Lazy
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
-- There is an option (builtin.grep_string) which searches for the string under the cursor
-- in the current working directory. May be useful for the future.

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


-- Vim Tmux Navigator
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown)
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp)
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft)
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Vim Fugitive
vim.keymap.set("n", "<leader>gs" , vim.cmd.Git)

-- Mason
vim.keymap.set("n", "<leader>m" , vim.cmd.Mason)

-- Zenmode
vim.keymap.set("n", "<leader>zm" , vim.cmd.ZenMode)

-- nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
