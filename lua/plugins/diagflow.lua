local status_ok, diagflow = pcall(require, "diagflow")
if not status_ok then
	return
end

diagflow.setup({
	max_width = 80,
	padding_top = 2,
	scope = "line",
})
