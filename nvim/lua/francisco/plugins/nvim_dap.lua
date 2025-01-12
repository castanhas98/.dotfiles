return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
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

        vim.keymap.set("n", "<leader>dc", function()
            dap.continue()
        end, { desc = "Continue" })
        vim.keymap.set("n", "<F5>", function()
            dap.continue()
        end, { desc = "Continue" })

        vim.keymap.set("n", "<leader>do", function()
            dap.step_over()
        end, { desc = "Step Over" })
        vim.keymap.set("n", "<F10>", function()
            dap.step_over()
        end, { desc = "Step Over" })

        vim.keymap.set("n", "<leader>di", function()
            dap.step_into()
        end, { desc = "Step Into" })
        vim.keymap.set("n", "<F11>", function()
            dap.step_into()
        end, { desc = "Step Into" })

        vim.keymap.set("n", "<leader>dO", function()
            dap.step_out()
        end, { desc = "Step Out" })
        vim.keymap.set("n", "<F12>", function()
            dap.step_out()
        end, { desc = "Step Out" })

        vim.keymap.set("n", "<leader>db", function()
            dap.toggle_breakpoint()
        end, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<F9>", function()
            dap.toggle_breakpoint()
        end, { desc = "Toggle Breakpoint" })

        vim.keymap.set("n", "<leader>dr", function()
            dap.restart()
        end, { desc = "Restart Debugging" })
        vim.keymap.set("n", "<leader>dt", function()
            dap.terminate()
        end, { desc = "Terminate Debugging" })


        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                -- CHANGE THIS to your path!
                command = "/home/francisco/.local/share/nvim/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }

        dap.adapters.python = function(cb, config)
            if config.request == "attach" then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or "127.0.0.1"
                cb({
                    type = "server",
                    port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                    host = host,
                    options = {
                        source_filetype = "python",
                    },
                })
            else
                cb({
                    type = "executable",
                    command = os.getenv("VIRTUAL_ENV") .. "/bin/python",
                    args = { "-m", "debugpy.adapter" },
                    options = {
                        source_filetype = "python",
                    },
                })
            end
        end

        -- For help on how to use the .vscode/launch.json for rust and cpp
        -- https://github.com/simrat39/rust-tools.nvim/wiki/Use-with-dap.ext.vscode-launch.json
        -- https://www.reddit.com/r/neovim/comments/16mdqfo/nvimdap_load_launchjs_help/
        require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "rust" } })
    end,
}
