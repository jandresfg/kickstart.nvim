return {
  {
    'ruifm/gitlinker.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitlinker').setup {
        opts = {
          remote = nil,
          add_current_line_on_normal_mode = true,
          action_callback = require('gitlinker.actions').open_in_browser,
          print_url = true,
          mappings = '<leader>gy',
        },
        callbacks = {
          ['gitlab.com'] = require('gitlinker.hosts').get_gitlab_type_url,
          ['gitlab.*.com'] = require('gitlinker.hosts').get_gitlab_type_url,
          ['jandresfg_amplifymd'] = function(url_data)
            url_data.host = 'gitlab.com'
            return require('gitlinker.hosts').get_gitlab_type_url(url_data)
          end,
        },
      }
    end,
    keys = {
      { '<leader>gy', mode = { 'n', 'v' }, desc = 'Open in browser (GitLab)' },
    },
  },
}
