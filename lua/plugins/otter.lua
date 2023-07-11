local status_ok, otter = pcall(require, "otter")
if not status_ok then
	return
end

otter.setup({})
