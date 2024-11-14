-- lua/plugins/neo-tree.lua
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\t', ':Neotree toggle<CR>', desc = 'NeoTree reveal' },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = 'right', -- Ensure NeoTree always opens on the right
      mappings = {
        ['<cr>'] = 'open_with_window_picker',
        -- Use <C-g> for live_grep in the selected folder
        ['<C-g>'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require('telescope.builtin').live_grep { cwd = path }
          end,
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function(arg)
          vim.cmd [[ setlocal relativenumber ]]
        end,
      },
    },
  },
  config = function(_, opts)
    opts.window.position = 'right' -- Set right-side position explicitly here too
    require('neo-tree').setup(opts)
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argc() == 0 then
          require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd(), position = 'right' }
        end
      end,
    })
  end,
}
