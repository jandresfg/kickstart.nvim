-- This is a template for creating new plugin files
-- Copy this file and customize it for your plugin

-- Simple plugin (no config needed)
-- return {
--   'owner/repo',
-- }

-- Plugin with options
-- return {
--   {
--     'owner/repo',
--     opts = {
--       -- Plugin configuration options
--       setting1 = true,
--       setting2 = 'value',
--     },
--   },
-- }

-- Plugin with custom config function
-- return {
--   {
--     'owner/repo',
--     config = function()
--       require('plugin').setup({
--         -- Configuration
--       })
--       -- Add keymaps
--       vim.keymap.set('n', '<leader>key', function()
--         -- Action
--       end, { desc = 'Description' })
--     end,
--   },
-- }

-- Plugin with dependencies and lazy loading
-- return {
--   {
--     'owner/repo',
--     dependencies = {
--       'other/plugin',
--       'another/plugin',
--     },
--     event = 'VimEnter',  -- Load on VimEnter event
--     -- or
--     ft = 'lua',  -- Load only for Lua files
--     -- or
--     keys = {  -- Load on these keybindings
--       { '<leader>key', desc = 'Description' },
--     },
--     config = function()
--       -- Setup code
--     end,
--   },
-- }

-- Plugin with multiple plugins in one file
-- return {
--   {
--     'owner/repo1',
--     config = function() ... end,
--   },
--   {
--     'owner/repo2',
--     opts = { ... },
--   },
-- }

-- Example: A real plugin file
return {
  {
    'your/plugin',
    -- Optional: Only load on specific events
    event = 'VimEnter',
    -- Optional: Lazy load on specific filetypes
    -- ft = { 'lua', 'vim' },
    -- Optional: Lazy load on specific keybindings
    -- keys = {
    --   { '<leader>key', desc = 'Action description' },
    -- },
    -- Plugin dependencies
    dependencies = {
      -- 'other/plugin',
    },
    -- Configuration options (alternative to config function)
    opts = {
      -- Your plugin options here
    },
    -- Custom configuration function (more control)
    config = function()
      -- local plugin = require('plugin')
      -- plugin.setup({
      --   -- Configuration
      -- })
      
      -- Add keybindings specific to this plugin
      -- vim.keymap.set('n', '<leader>key', plugin.action, {
      --   desc = 'Action description',
      --   silent = true,
      -- })
    end,
  },
}
