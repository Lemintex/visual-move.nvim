local M = {}
M.config = {}
M.did_setup = false

-- todo: add opta
M.setup = function (_)
  if M.did_setup == true then return end
	M.did_setup = true
	vim.keymap.set("n", "<M-j>", function()
		local cursor, len = M._get_line_number()
		return M.down(cursor[1], len)
	end)

	vim.keymap.set("n", "<M-k>", function()
		local cursor, len = M._get_line_number()
		return M.up(cursor[1], len)
	end)
end

M._get_line_number = function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local len = vim.api.nvim_buf_line_count(0)
	return cursor, len
end
M.down = function(num, len)
	if num == len then
		return
	end
	if num < len - 1 then
		vim.api.nvim_feedkeys('"0ddj"0P', "n", {})
	else -- handles a literal edge case
		vim.api.nvim_feedkeys('"0dd"0p', "n", {})
	end
end

M.up = function(num, len)
	if num == 1 then
		return
	end
	if num > 1 and num < len then
		vim.api.nvim_feedkeys('"0ddk"0P', "n", {})
	else -- handles a literal edge case
		vim.api.nvim_feedkeys('"0dd"0P', "n", {})
	end
end
return M
