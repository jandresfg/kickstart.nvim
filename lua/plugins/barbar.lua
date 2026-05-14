return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      auto_hide = 1,
    },
    version = '^1.0.0',
    keys = {
      { '<leader>q', '<cmd>BufferClose<cr>', desc = 'Close Buffer' },
      { '<leader>l', '<cmd>BufferNext<cr>', desc = 'Next Buffer' },
      { '<leader>h', '<cmd>BufferPrevious<cr>', desc = 'Previous Buffer' },
    },
  },
}
