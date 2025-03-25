return{ 
	"bluz71/vim-nightfly-guicolors",
	priority = 1000,
	config = function()
		-- load the colorcheme
		vim.cmd([[colorscheme nightfly]])
	end, 
}

