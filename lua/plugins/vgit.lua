local status_ok, vgit = pcall(require, "vgit")
if not status_ok then
	return
end

vgit.setup({
	settings = {
		-- authorship_code_lens = { enabled = false },
		live_blame = { enabled = false },
	},
})
