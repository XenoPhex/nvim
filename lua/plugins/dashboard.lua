local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end

dashboard.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{
				icon = " ",
				desc = "Update Plugins",
				group = "@property",
				action = "Lazy update",
				key = "u",
			},
			{
				icon = " ",
				desc = "Update LSP",
				group = "@property",
				action = "Mason",
				key = "m",
			},
			{
				icon = " ",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "p",
			},
			{
				icon = " ",
				desc = "Search",
				group = "Files",
				action = "Telescope live_grep",
				key = "f",
			},
		},
	},
})
