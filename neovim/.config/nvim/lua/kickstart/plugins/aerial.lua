return {
  'stevearc/aerial.nvim',
  opts = {
    backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
    layout = {
      default_direction = 'right',
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = { { '\\s', '<cmd>AerialToggle! right<cr>', desc = 'Outline Symbols' } },
}
