local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	return
end

fidget.setup({
	align = {},
	fmt = {
		stack_upwards = false,
	},
	text = {
		spinner = "dots_snake",
	},
	timer = {
		spinner_rate = 50,
		fidget_decay = 0,
	},
	window = {
		blend = 10,
		-- relative = "editor",
	},
})
