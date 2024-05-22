require("dap")
local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

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

vim.keymap.set("n", ",db", dap.toggle_breakpoint, {})
vim.keymap.set("n", ",dc", dap.continue, {})
local M = {}
-- https://github.com/mfussenegger/nvim-dap/wiki/Local-and-Remote-Debugging-with-Docker#Python
M.attach_python_debugger = function(args)
    local dap = require "dap"
    local host = args[1] -- This should be configured for remote debugging if your SSH tunnel is setup.
    -- You can even make nvim responsible for starting the debugpy server/adapter:
    --  vim.fn.system({"${some_script_that_starts_debugpy_in_your_container}", ${script_args}})
    pythonAttachAdapter = {
        type = "server";
        host = host;
        port = tonumber(5678);
    }
    pythonAttachConfig = {
        type = "python";
        request = "attach";
        connect = {
            port = tonumber(5678);
            host = host;
        };
        mode = "remote";
        name = "Remote Attached Debugger";
        cwd = vim.fn.getcwd();
        pathMappings = {
            {
                localRoot = vim.fn.getcwd(); -- Wherever your Python code lives locally.
                remoteRoot = "/usr/src/app"; -- Wherever your Python code lives in the container.
            };
        };
    }
    local session = dap.attach(host, tonumber(5678), pythonAttachConfig)
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open()
end
