# Neovim Configuration Refactoring

## Summary
Your Neovim configuration has been refactored to organize plugins into separate files for better maintainability. Each plugin now has its own file in `lua/plugins/` directory.

## File Structure
```
~/.config/nvim/
├── init.lua                  # Main configuration file (core settings, keymaps, lazy.nvim setup)
├── init.lua.original         # Backup of original init.lua
├── lua/
│   └── plugins/              # Individual plugin configuration files
│       ├── alpha-nvim.lua
│       ├── barbar.lua
│       ├── blame.lua
│       ├── conform.lua
│       ├── debugprint.lua
│       ├── diffview.lua
│       ├── dropbar.lua
│       ├── gitlab.lua
│       ├── gitlinker.lua
│       ├── gitsigns.lua
│       ├── hover.lua
│       ├── lspconfig.lua
│       ├── mini.lua
│       ├── neo-tree.lua
│       ├── neogit.lua
│       ├── nvim-autopairs.lua
│       ├── nvim-cmp.lua
│       ├── nvim-puppeteer.lua
│       ├── nvim-treesitter.lua
│       ├── nvim-ufo.lua
│       ├── smear-cursor.lua
│       ├── split-term.lua
│       ├── telescope.lua
│       ├── tiny-inline-diagnostic.lua
│       ├── todo-comments.lua
│       ├── tokyonight.lua
│       ├── vim-sleuth.lua
│       └── which-key.lua
```

## Key Changes

### 1. Simplified init.lua
- **Before**: All plugin configurations were in one massive init.lua file (~1400 lines)
- **After**: Only contains core Vim settings, keymaps, and lazy.nvim initialization (~165 lines)

### 2. Plugin Organization
Each plugin is now in its own file in `lua/plugins/`:
- **Easier to navigate**: Find plugin configs by filename
- **Easier to maintain**: Modify plugin config without scrolling through hundreds of lines
- **Easier to add/remove**: Just create/delete a file
- **Lazy loading**: Lazy.nvim automatically discovers and loads all plugins from this directory

### 3. Lazy.nvim Import Pattern
The new init.lua uses lazy.nvim's import feature:
```lua
require('lazy').setup({
  { import = 'plugins' },  -- Loads all files from lua/plugins/
  ...
})
```

## Plugin Categories

### Git Integration
- `gitsigns.lua` - Git signs in gutter
- `neogit.lua` - Git interface
- `gitlab.lua` - GitLab integration
- `gitlinker.lua` - Generate git links
- `blame.lua` - Blame annotations

### Fuzzy Finding & Navigation
- `telescope.lua` - Fuzzy finder
- `neo-tree.lua` - File tree explorer
- `dropbar.lua` - Winbar with symbols
- `barbar.lua` - Buffer tabs

### LSP & Completion
- `lspconfig.lua` - LSP configuration (includes lazydev, mason, fidget, diagnostics)
- `nvim-cmp.lua` - Autocompletion
- `conform.lua` - Code formatting

### UI/UX
- `alpha-nvim.lua` - Dashboard
- `tokyonight.lua` - Color scheme
- `which-key.lua` - Keybinding hints
- `hover.lua` - Hover documentation
- `tiny-inline-diagnostic.lua` - Inline diagnostics
- `smear-cursor.lua` - Cursor animation

### Editing & Enhancements
- `nvim-autopairs.lua` - Auto pairs
- `nvim-treesitter.lua` - Syntax highlighting
- `nvim-ufo.lua` - Code folding
- `debugprint.lua` - Debug printing helper
- `gitlinker.lua` - Git link generation
- `split-term.lua` - Terminal splitting
- `mini.lua` - Mini.nvim collection (ai, surround, statusline)
- `todo-comments.lua` - TODO comments highlighting
- `nvim-puppeteer.lua` - Puppeteer automation
- `vim-sleuth.lua` - Indentation detection

## How to Modify Plugins

### Edit an existing plugin
```bash
# Open the plugin file directly
nvim ~/.config/nvim/lua/plugins/telescope.lua
```

### Add a new plugin
1. Create a new file: `~/.config/nvim/lua/plugins/plugin-name.lua`
2. Return a table with plugin spec:
```lua
return {
  {
    'owner/repo',
    opts = { ... },
    config = function() ... end,
  }
}
```
3. Save and restart Neovim (plugins are auto-loaded)

### Remove a plugin
1. Delete the corresponding file from `~/.config/nvim/lua/plugins/`
2. Restart Neovim

## Helpful Commands

Once your configuration is loaded in Neovim:
- `:Lazy` - Open Lazy.nvim UI to manage plugins
- `:Lazy sync` - Install/update all plugins
- `:checkhealth` - Check plugin health

## Backup
Your original init.lua has been saved as `init.lua.original`. You can restore it anytime if needed:
```bash
cp ~/.config/nvim/init.lua.original ~/.config/nvim/init.lua
```

## Notes
- The configuration uses lazy.nvim's automatic plugin discovery
- All keymaps specific to each plugin are defined within their respective files
- The main init.lua contains only core Vim settings that don't require a specific plugin

## Troubleshooting

If a plugin isn't loading:
1. Check that the file is in `lua/plugins/` directory
2. Verify the file returns a table with plugin spec
3. Run `:checkhealth` to see if there are any warnings
4. Check `:Lazy` UI for plugin status

If you encounter any errors:
1. Check the Neovim log: `:messages`
2. Try `:Lazy sync` to reinstall all plugins
3. Restart Neovim
