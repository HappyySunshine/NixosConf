eww = {
	pattern = "yuck",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
	end,
}

c = {
	pattern = { "c", "cpp" },
	callback = function()
		-- Set the keymap for the current buffer
		vim.keymap.set("n", "<leader>cr", function()
			vim.fn.system("cd build && cmake .. && make && ./Main")
		end, { buffer = true })
		vim.keymap.set("n", "<leader>cb", function()
			vim.fn.cmd("!cd build && cmake .. && make && ./Main")
		end, { buffer = true })
	end,
}
vim.api.nvim_create_autocmd("FileType", eww)
vim.api.nvim_create_autocmd("FileType", c)
