return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    opts = {
      graph_style = 'unicode',
    },
    keys = {
      { '<leader>g', '<cmd>Neogit<cr>', desc = 'Git' },
    },
  },
}
