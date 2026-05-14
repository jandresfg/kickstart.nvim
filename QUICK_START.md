# Quick Start Guide - Modular Neovim Configuration

## Overview
Your Neovim configuration is now organized with plugins in separate files. This makes it much easier to find, edit, and add plugins.

## Common Tasks

### View a Plugin's Configuration
```bash
# Example: View telescope plugin config
cat ~/.config/nvim/lua/plugins/telescope.lua
```

### Edit a Plugin's Settings
```bash
# Example: Edit LSP configuration
nvim ~/.config/nvim/lua/plugins/lspconfig.lua
```

### Add a New Plugin

1. **Create a new file** in `lua/plugins/`:
```bash
touch ~/.config/nvim/lua/plugins/my-plugin.lua
```

2. **Add the plugin spec**:
```lua
-- ~/.config/nvim/lua/plugins/my-plugin.lua
return {
  {
    'owner/repo-name',
    opts = {
      -- Plugin options here
    },
  }
}
```

3. **Restart Neovim** - it will automatically load the new plugin

### Remove a Plugin
```bash
# Simply delete the plugin file
rm ~/.config/nvim/lua/plugins/plugin-name.lua
# Restart Neovim
```

### Temporarily Disable a Plugin
Rename the file to add `.disabled`:
```bash
mv ~/.config/nvim/lua/plugins/plugin.lua ~/.config/nvim/lua/plugins/plugin.lua.disabled
```

## Useful Neovim Commands

| Command | Purpose |
|---------|---------|
| `:Lazy` | Open Lazy.nvim plugin manager |
| `:Lazy sync` | Install/update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:checkhealth` | Check for configuration issues |
| `:messages` | View error messages |

## Example: Adding a Common Plugin

### Example 1: Adding Nvim-Notify (Better Notifications)

1. Create `~/.config/nvim/lua/plugins/nvim-notify.lua`:
```lua
return {
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = '#000000',
    },
    config = function()
      vim.notify = require('notify')
    end,
  }
}
```

2. Restart Neovim - done!

### Example 2: Adding Null-ls (Alternative Formatters)

1. Create `~/.config/nvim/lua/plugins/null-ls.lua`:
```lua
return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      })
    end,
  }
}
```

2. Restart Neovim - done!

## File Structure After Refactoring

```
~/.config/nvim/
├── init.lua                    # Core settings (DO NOT put plugins here anymore)
├── init.lua.original           # Your original init.lua (backup)
├── REFACTORING_NOTES.md        # Detailed refactoring notes
├── QUICK_START.md              # This file
├── PLUGIN_TEMPLATE.lua         # Template for new plugins
│
├── lua/
│   └── plugins/                # ← All your plugin configs go here!
│       ├── alpha-nvim.lua
│       ├── barbar.lua
│       ├── telescope.lua
│       └── ... (28 plugin files total)
│
└── kickstart/                  # (Original Kickstart extras)
    └── plugins/
        ├── indent_line.lua
        └── gitsigns.lua
```

## Tips & Best Practices

### 1. One Plugin Per File (Usually)
- Each file typically contains one plugin specification
- Exception: Related plugins (like LSP plugins) can share a file

### 2. Organize Comments
```lua
-- ~/.config/nvim/lua/plugins/my-plugin.lua
-- Purpose: Brief description of what this plugin does
-- Usage: Brief usage instructions

return {
  {
    'owner/repo',
    -- ... config
  }
}
```

### 3. Group Related Keymaps
Put all keymaps for a plugin in its config function:
```lua
config = function()
  require('plugin').setup()
  
  -- Keymaps for this plugin
  vim.keymap.set('n', '<leader>key1', ..., { desc = 'Action 1' })
  vim.keymap.set('n', '<leader>key2', ..., { desc = 'Action 2' })
end
```

### 4. Use Lazy Loading When Appropriate
```lua
-- Load only when needed
event = 'VimEnter',           -- Load on startup
ft = 'rust',                  -- Load only for Rust files
keys = { '<leader>key' },     -- Load when this key is pressed
cmd = { 'MyCommand' },        -- Load when this command is run
```

### 5. Keep Plugin Configs Focused
- One responsibility per file
- Don't mix unrelated configurations
- If it gets too long, consider splitting into separate plugins

## Troubleshooting

### Plugin Not Loading?
1. Check file is in `lua/plugins/` directory
2. Verify it returns a table with plugin spec
3. Run `:Lazy` to see plugin status
4. Check `:messages` for errors

### Want to Restore Original?
```bash
# Restore from backup
cp ~/.config/nvim/init.lua.original ~/.config/nvim/init.lua
# Remove the plugins directory if you want to start fresh
rm -rf ~/.config/nvim/lua/plugins
```

### Need to Debug?
```bash
# Inside Neovim
:checkhealth     # Overall health check
:Lazy            # See plugin status
:messages        # Check for error messages
:verbose set rtp # Check runtime path
```

## Next Steps

1. **Explore your plugins**: Open and read through `lua/plugins/` files
2. **Customize as needed**: Edit individual plugin files
3. **Add new plugins**: Create new files in `lua/plugins/`
4. **Remove unused plugins**: Delete files you don't need
5. **Test it out**: Run `:Lazy sync` and `:checkhealth`

Happy configuring! 🎉
