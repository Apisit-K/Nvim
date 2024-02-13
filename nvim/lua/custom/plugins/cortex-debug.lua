return{
  "jedrzejboczar/nvim-dap-cortex-debug",

  dependencies = {'mfussenegger/nvim-dap'},
  config = function ()

    require('dap-cortex-debug').setup {
    debug = false,  -- log debug messages
    -- path to cortex-debug extension, supports vim.fn.glob
        extension_path = vim.fn.glob('$HOME/cortex-debug/'),
        lib_extension = nil, -- tries auto-detecting, e.g. 'so' on unix
        node_path = '/usr/bin/nodejs', -- path to node.js executable
        dapui_rtt = true, -- register nvim-dap-ui RTT element
        dap_vscode_filetypes = { 'c', 'cpp' }, -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
        }

    require('dap').configurations.c ={
    {
        name = 'Example debugging with OpenOCD',
        type = 'cortex-debug',
        request = 'launch',
        servertype = 'openocd',
        serverpath = '/usr/bin/openocd',
        gdbPath = '/usr/bin/gdb-multiarch',
        toolchainPath = '/usr/bin/arm-none-eabi-gcc',
        toolchainPrefix = 'arm-none-eabi',
        runToEntryPoint = 'main',
        swoConfig = { enabled = false },
        showDevDebugOutput = true,
        gdbTarget = 'localhost:3333',
        cwd = '${workspaceFolder}',
        executable = '${workspaceFolder}/build/firmware.elf',
        configFiles = { '/usr/share/openocd/scripts/interface/stlink.cfg',
          '/usr/share/openocd/scripts/target/stm32f4x.cfg'},
        rttConfig = {
            address = 'auto',
            decoders = {
                {
                    label = 'RTT:0',
                    port = 0,
                    type = 'console'
                }
            },
            enabled = true
        },
    }

  }
  end
}
