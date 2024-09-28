return {
  'sindrets/diffview.nvim',
  opts = {
    -- options
    view = {
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = 'diff3_mixed',
      },
    },
    file_panel = {
      win_config = { -- See |diffview-config-win_config|
        position = 'right',
        width = 35,
        win_opts = {},
      },
    },
  },
  keys = {
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git History: current' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Git History: All' },
    { '<leader>go', '<cmd>DiffviewOpen<cr>', desc = 'Diff Tool: [O]pen' },
    { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = 'Diff Tool: [Q]uit' },
  },
}
