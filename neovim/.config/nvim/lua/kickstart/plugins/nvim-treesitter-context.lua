return {
  'nvim-treesitter/nvim-treesitter-context',
  requires = 'nvim-treesitter/nvim-treesitter', -- Ensure you have nvim-treesitter installed
  config = function()
    require('treesitter-context').setup {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      throttle = true, -- Throttles plugin updates (may improve performance)
      max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
      patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
          'class',
          'function',
          'method',
        },
      },
    }
  end,
}
