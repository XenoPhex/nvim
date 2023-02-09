local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Find Files
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<cr>", opts)

-- Hit Return to save
keymap("n", "<Enter>", "<cmd>wa<cr>", opts)

-- No highlight
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Current file's path in command mode
keymap("c", "%%", [[expand('%:h').'/']], { expr = true })
