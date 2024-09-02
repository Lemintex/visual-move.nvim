local M = {}

vim.keymap.set("n", "<M-j>", function()
	return M.down()
end)

vim.keymap.set("n", "<M-k>", function()
	return M.up()
end)

M.down = function()
	vim.api.nvim_feedkeys('"0ddj"0P', "n", {})
end

M.up = function()
	vim.api.nvim_feedkeys('"0ddk"0P', "n", {})
end

return M

--1111111111111111
--  2222222222222222222222
--  3333333333333333
--  44444444444
--  5555555555555555
