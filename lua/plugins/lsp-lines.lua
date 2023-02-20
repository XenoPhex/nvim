local status_ok, lines = pcall(require, "lsp_lines")
if not status_ok then
	return
end

lines.setup()
