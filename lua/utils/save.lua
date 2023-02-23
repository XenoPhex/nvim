local M = {}

M.save = function()
	if string.len(vim.api.nvim_eval([[&buftype]])) > 0 then
		return nil
	end

	if vim.api.nvim_eval([[&modified]]) ~= 1 then
		return nil
	end

	vim.schedule(function()
		vim.cmd("silent! write")
	end)
end

return M
