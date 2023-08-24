local jcheng = {}

jcheng["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("jcheng.todo-comments"), -- Require that config
}
jcheng["xeluxee/competitest.nvim"] = {
	-- "xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ "<leader>cpa", "<cmd>CompetiTest add_testcase<cr>", desc = "Add TestCases" },
		{ "<leader>cpe", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit TestCases" },
		{ "<leader>cpr", "<cmd>CompetiTest run<cr>", desc = "Run All TestCases" },
	},
	config = function()
		require("competitest").setup({
			save_current_file = true,
			compile_directory = ".",
			compile_command = {
				c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", ".$(FNOEXT).out" } },
				cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", ".$(FNOEXT).out" } },
				rust = { exec = "rustc", args = { ".$(FNAME).out" } },
				java = { exec = "javac", args = { ".$(FNAME).out" } },
			},
			running_directory = ".",
			run_command = {
				c = { exec = "./.$(FNOEXT).out" },
				cpp = { exec = "./.$(FNOEXT).out" },
				rust = { exec = "./.$(FNOEXT).out" },
				python = { exec = "python", args = { "$(FNAME)" } },
				java = { exec = "java", args = { ".$(FNOEXT).out" } },
			},

			testcases_directory = "./.cph/tc/",
			testcases_use_single_file = false,
			testcases_auto_detect_storage = true,
			testcases_single_file_format = "$(FNOEXT).testcases",
			testcases_input_file_format = "$(FNOEXT)_in_$(TCNUM).txt",
			testcases_output_file_format = "$(FNOEXT)_out_$(TCNUM).txt",
		})
	end,
}
return jcheng
