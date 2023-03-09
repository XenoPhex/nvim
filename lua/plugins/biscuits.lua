local status_ok, biscuits = pcall(require, "nvim-biscuits")
if not status_ok then
	return
end

biscuits.setup({
	on_events = { "InsertLeave", "CursorHold", "CursorHoldI" },
	default_config = {
		cursor_line_only = true,
		max_length = 60,
		min_distance = 3,
		prefix_string = " 📌 ",
		show_on_start = true,
	},
	language_config = {
		yaml = { -- Disable on yaml cuz of the slows
			disabled = true,
		},
		help = {
			disabled = true,
		},
	},
})
