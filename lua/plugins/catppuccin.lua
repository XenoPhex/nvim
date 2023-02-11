local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavour = "latte",
	integrations = {
		-- For integrations see: https://github.com/catppuccin/nvim#integrations
		barbecue = {
			dim_dirname = true,
		},
		navic = {
			enabled = true,
			highlight = true,
		},
		cmp = true,
		mason = true,
		notify = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = true,
		which_key = true,
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")