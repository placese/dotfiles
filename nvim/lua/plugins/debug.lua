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
    local cwd = vim.fn.getcwd()
    require("dapui").setup()
    local dap_python = require("dap-python")
    dap_python.setup()
    require("nvim-dap-virtual-text").setup()
    dap_python.test_runner = "pytest"
    dap.adapters.container = function(cb, config)
      if config.preLaunchTask then
        vim.fn.system(config.preLaunchTask)
      end
      local adapter = {
        type = "server",
        host = config.connect.host,
        port = config.connect.port,
        options = {
          detached = true,
          max_retries = 1000,
          initialize_timeout_sec = 1000,
        },
      }
      return cb(adapter)
    end
    table.insert(dap.configurations.python, {
      type = "container",
      request = "attach",
      name = "Attach in Docker",
      mode = "remote",
      cwd = vim.fn.getcwd(),
      connect = { host = "0.0.0.0", port = 5678 },
      preLaunchTask = string.format("cd %s && make debugee-on", cwd),
      pathMappings = function()
        local local_path = vim.fn.input(string.format("Local path mapping [%s]", cwd))
        local_path = local_path ~= "" and local_path or cwd
        local remote_path = vim.fn.input("Container path mapping [/app]: ")
        remote_path = remote_path ~= "" and remote_path or "/app"
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
      { text = "→", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
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
      vim.fn.system(string.format("cd %s && make debugee-off", cwd))
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      vim.fn.system(string.format("cd %s && make debugee-off", cwd))
      dapui.close()
    end
    vim.keymap.set("n", "<Leader>db", dap.continue, {})
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>df", dap_python.test_method, {})
  end,
}
