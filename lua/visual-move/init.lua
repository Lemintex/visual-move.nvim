local M = {}

M._get_line_number = function()
	local row, _ = vim.api.nvim_win_get_cursor(0)
	local len = vim.api.nvim_buf_line_count(0)
	return row, len
end

vim.keymap.set("n", "<M-j>", function()
	local num, len = M._get_line_number()
	return M.down(table.unpack(num), len)
end)

vim.keymap.set("n", "<M-k>", function()
	return M.up()
end)

M.down = function(num, len)
	if num < len - 1 then
		vim.api.nvim_feedkeys('"0ddj"0P', "n", {})
	elseif num == len - 1 then -- handles a literal edge case
		vim.api.nvim_feedkeys('"0dd"0p', "n", {})
	end
end

M.up = function()
	vim.api.nvim_feedkeys('"0ddk"0P', "n", {})
end

return M
