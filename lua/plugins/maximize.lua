return {
	"declancm/maximize.nvim",
	config = function()
		vim.keymap.set("n", "<leader>m", ":Maximize<CR>")
		return true
	end,
}
