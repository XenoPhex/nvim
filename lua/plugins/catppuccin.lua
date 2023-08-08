local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
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
		notify = true,
		neotree = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		rainbow_delimiters = true,
		which_key = true,
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
