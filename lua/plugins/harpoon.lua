return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- it was originally ctrl + h
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		-- it was originally ctrl + t
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		-- it was originally ctrl + n
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		-- it was originally ctrl + s
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
