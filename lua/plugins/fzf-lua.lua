local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
	vim.notify("fzf-lua could not load", vim.log.levels.WARN)
	return
end

fzf.setup({
	winopts = {
		preview = {
			vertical = "up:65%",
			wrap = "wrap",
			layout = "vertical",
		},
	},
})
