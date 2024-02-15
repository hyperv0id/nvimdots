local jcheng = {}

jcheng["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("custom.todo-comments"), -- Require that config
}

--- 算法自动化测试
jcheng["xeluxee/competitest.nvim"] = {
	-- "xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ "<leader>cpa", "<cmd>CompetiTest add_testcase<cr>", desc = "Add TestCases" },
		{ "<leader>cpe", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit TestCases" },
		{ "<leader>cpr", "<cmd>CompetiTest run<cr>", desc = "Run All TestCases" },
	},
	config = require("custom.competitest"),
}

jcheng["ray-x/go.nvim"] = {
	-- https://github.com/ray-x/go.nvim
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("custom.golang")
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}

return jcheng
