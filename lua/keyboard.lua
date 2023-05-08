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
		"<leader>f",
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
		"<leader>t",
		":noh<CR>",
		description = "Hide current highlighting",
		mode = "n",
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
	{
		"<leader>s",
		":'<,'>sort i<cr>",
		description = "Sort selected list",
		mode = "v",
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
	{
		-- hotkeys set by wsdjeg/vim-fetch
		"gF",
		description = "Go to file under cursor (includes ':line number:character number')",
	},

	-- Spider config
	{
		"w",
		function()
			require("spider").motion("w")
		end,
		"Spider-w",
		{ "n", "o", "x" },
	},
	{
		"e",
		function()
			require("spider").motion("e")
		end,
		"Spider-e",
		{ "n", "o", "x" },
	},
	{
		"b",
		function()
			require("spider").motion("b")
		end,
		"Spider-b",
		{ "n", "o", "x" },
	},
	{
		"ge",
		function()
			require("spider").motion("ge")
		end,
		"Spider-ge",
		{ "n", "o", "x" },
	},

	-- Folding
	{
		"zR",
		":lua require('ufo').openAllFolds()<cr>",
		description = "Open all folds",
		mode = "n",
	},
	{
		"zM",
		":lua require('ufo').closeAllFolds()<cr>",
		description = "Close all folds",
		mode = "n",
	},

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
		"gi",
		function()
			require("pretty_hover").hover()
		end,
		description = "Display documentation below cursor",
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
	-- Go Alt Files
	{
		"gaa",
		function()
			require("utils.alternate").switch(false, "")
		end,
		description = "GoLang Alt file",
	},
	{
		"gas",
		function()
			require("utils.alternate").switch(false, "split")
		end,
		description = "GoLang Alt file in splint",
	},
	{
		"gav",
		function()
			require("utils.alternate").switch(false, "vsplit")
		end,
		description = "GoLang Alt file in vsplit",
	},
}
