local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	flavour = "latte",
	dim_inactive = {
		enabled = true,
	},
	integrations = {
		-- For integrations see: https://github.com/catppuccin/nvim#integrations
		barbecue = {
			dim_dirname = true,
			alt_background = true,
		},
		navic = {
			enabled = true,
			highlight = true,
		},
		cmp = true,
		dashboard = true,
		lsp_trouble = true,
		mason = true,
		neotree = true,
		notify = true,
		rainbow_delimiters = true,
		symbols_outline = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		which_key = true,
		window_picker = true,
		fidget = true,
		ufo = true,
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
