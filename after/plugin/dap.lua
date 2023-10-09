-- Debugger
require('dapui').setup()


vim.keymap.set('n', '<leader>dt', ':lua require("dapui").toggle() <CR>', { desc = "DapUi - toggle UI"})
vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { desc = "DapUi - DapToggle[B]reakpoint"})
vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>', { desc = "DapUi - Dap[C]ontinue"})

vim.api.nvim_set_keymap('n', '<leader>db', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })


local dap = require('dap')

-- lua
-- lua adapter
dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end


-- lua configurations
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
        file = '${file}',
  }
}



-- c
-- c adapter
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  -- args = { "-i", "dap" }
  args = {}
}


-- c configurations
dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = '${file}',
    },
}



-- python
-- python adapter
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      -- command = '~/.virtualenvs/debugpy/bin/python', -- 'path/to/virtualenvs/debugpy/bin/python',
      command = '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end


  -- python configuration
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}


