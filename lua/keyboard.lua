-- vim.api.nvim_set_keymap("c", "%%", [[expand('%:h').'/']], { expr = true })

-- readline bindings
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>")
vim.keymap.set({ "i", "c" }, "<M-b>", "<C-Left>")

vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>")
vim.keymap.set({ "i", "c" }, "<M-f>", "<C-Right>")

vim.keymap.set({ "i", "c" }, "<C-d>", "<Del>")
vim.keymap.set({ "i", "c" }, "<M-d>", "<C-Right><C-w>")
vim.keymap.set({ "i", "c" }, "<C-h>", "<BS>")

vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>")
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>")

return {
	-- Find
	{
		"<leader>a",
		":Legendary<CR>",
		description = "Search for Action",
	},
	{
		"<C-p>",
		":FzfLua files<CR>",
		description = "Fuzzy Find / Search for file",
	},
	{
		"<C-f>",
		":FzfLua  lgrep_curbuf<CR>",
		description = "Search in all files",
	},
	{
		"<C-S-f>",
		":FzfLua live_grep<CR>",
		description = "Search in all files",
	},
	{
		"<leader>h",
		":FzfLua help_tags<CR>",
		description = "Search in help",
	},
	{
		"<C-e>",
		":FzfLua oldfiles<CR>",
		description = "Search in recently opened files",
	},
	{
		"<leader>s",
		":FzfLua grep_cword<cr>",
		description = "Search for word under cursor",
	},
	{
		"<leader>b",
		":FzfLua buffers<cr>",
		description = "Search open buffers",
	},

	-- Generic
	{
		"<Enter>",
		":lua require('utils.save').save()<CR>",
		description = "Save current file",
	},
	{
		"<Esc>",
		":noh<CR>",
		description = "Hide current highlighting",
	},
	{
		"Y",
		'"+y',
		description = "Copy to system clipboard",
		mode = "x",
	},
	{
		"<leader>n",
		":Telescope notify<cr>",
		description = "Display notifications",
	},

	-- Keep indenting
	{ ">", ">gv", mode = "x" },
	{ "<", "<gv", mode = "x" },

	-- Navigation
	{
		"<leader>e",
		":Neotree reveal source=filesystem reveal=true<cr>",
		description = "Show file in tree",
	},
	{
		"<leader><S-e>",
		":NeoTreeClose<cr>",
		description = "Close file browser",
	},
	{ "gF", description = "Go to file under cursor (includes ':line number:character number')" },

	-- LSP Features
	{
		"gd",
		":FzfLua lsp_definitions<cr>",
		description = "Go to definition",
	},
	{
		"gr",
		":FzfLua lsp_references<cr>",
		description = "Go to references",
	},
	{
		"gm",
		":FzfLua lsp_implementations<cr>",
		description = "Go to implementations",
	},
	{
		"gl",
		":lua vim.diagnostic.open_float()<CR>",
		description = "Display float",
	},
	{
		"<leader>ld",
		":TroubleToggle<cr>",
		description = "Display diagnostic list",
	},
	{
		"<leader>l<S-w>",
		":TroubleToggle workspace_diagnostics<cr>",
		description = "Display workspace diagnostic list (quicklist)",
	},
	{
		"<leader>lw",
		":FzfLua lsp_workspace_diagnostics<cr>",
		description = "Display workspace diagnostic list",
	},
	{
		"<leader>lr",
		":lua vim.lsp.buf.rename()<cr>",
		description = "Rename",
	},
	{
		"<leader>lp",
		":lua vim.lsp.buf.signature_help()<cr>",
		description = "Show Parameters",
	},
	{
		"=",
		":lua vim.lsp.buf.format({ async = true })<cr>",
		description = "Auto-indent lines",
	},
}
