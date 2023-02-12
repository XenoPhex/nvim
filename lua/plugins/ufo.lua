local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	return
end

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})

require("statuscol").setup({
	foldfunc = "builtin",
	setopt = true,
})

--Setting up folding
vim.api.nvim_set_option("foldcolumn", "1") -- '0' is not bad
vim.api.nvim_set_option("foldlevel", 99) -- Using ufo provider need a large value, feel free to decrease the value
vim.api.nvim_set_option("foldlevelstart", 99)
vim.api.nvim_set_option("foldenable", true) --Disabled folding on start up
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
