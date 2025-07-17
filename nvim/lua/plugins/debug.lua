return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/cmp-dap",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()
		local dap_python = require("dap-python")
		dap_python.setup()
		require("nvim-dap-virtual-text").setup()
		dap_python.test_runner = "pytest"
		table.insert(require("dap").configurations.python, {
			type = "python",
			request = "attach",
			mode = "remote",
			name = "Attach in Docker",
			cwd = vim.fn.getcwd(),
			connect = function()
				local host = vim.fn.input("Host [0.0.0.0]: ")
				host = host ~= "" and host or "0.0.0.0"
				local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
				return { host = host, port = port }
			end,
			pathMappings = function()
				local cwd = vim.fn.getcwd()
				local local_path = vim.fn.input("Local path mapping [" .. cwd .. "]: ")
				local_path = local_path ~= "" and local_path or cwd
				local remote_path = vim.fn.input("Remote path mapping [.]: ")
				remote_path = remote_path ~= "" and remote_path or "."
				return { { localRoot = local_path, remoteRoot = remote_path } }
			end,
		})

		vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
		vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
		vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
		vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		require("cmp").setup({
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
			end,
		})

		require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
			sources = {
				{ name = "dap" },
			},
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<Leader>db", dap.continue, {})
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>df", dap_python.test_method, {})
	end,
}
