-- lua/plugins/neo-tree.lua
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\t', ':Neotree toggle<CR>', desc = 'NeoTree reveal' },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    window = {
      position = 'right',
      mappings = {
        ['<cr>'] = 'open_with_window_picker',
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
    -- Add event handler for setting relative line numbers
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function(arg)
          vim.cmd [[
                setlocal relativenumber
              ]]
        end,
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    -- Automatically open Neo-tree on startup if no file is specified
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        local argc = vim.fn.argc()
        if argc == 0 then
          require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
        end
      end,
    })
  end,
}
