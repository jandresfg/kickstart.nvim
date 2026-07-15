return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    opts = {
      hijack_netrw_behavior = 'open_current',
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
    keys = {
      { '<leader>tt', '<cmd>Neotree reveal<cr>', desc = 'Open file tree (reveal current file)' },
    },
  },
}
