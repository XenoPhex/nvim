local status_ok, otter = pcall(require, "otter.config")
if not status_ok then
	return
end

otter.setup({})
