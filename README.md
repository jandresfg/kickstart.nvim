# Neovim Configuration

Welcome to your modular Neovim configuration! This setup organizes all your plugins into separate files for better maintainability.

## 📚 Documentation Index

Start here based on what you want to do:

### For Beginners
- **[QUICK_START.md](./QUICK_START.md)** - Start here! Common tasks and examples
  - How to add a new plugin
  - How to edit a plugin's settings
  - How to remove a plugin
  - Common Neovim commands

### For Deep Dives
- **[REFACTORING_NOTES.md](./REFACTORING_NOTES.md)** - Detailed documentation
  - Complete file structure
  - Plugin categories
  - Troubleshooting guide

### For Developers
- **[PLUGIN_TEMPLATE.lua](./PLUGIN_TEMPLATE.lua)** - Template for new plugins
  - Examples of different plugin specifications
  - How to structure plugin files
  - Lazy loading patterns

## 🚀 Quick Setup

1. **Verify everything works:**
   ```vim
   :Lazy              " Check plugin status
   :checkhealth       " Check for issues
   ```

2. **Edit a plugin:**
   ```bash
   nvim ~/.config/nvim/lua/plugins/telescope.lua
   ```

3. **Add a new plugin:**
   ```bash
   # Create new file
   touch ~/.config/nvim/lua/plugins/my-plugin.lua
   
   # Add plugin spec and restart Neovim
   ```

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                    ← Core Vim settings (167 lines)
├── init.lua.original           ← Backup of original
├── README.md                   ← This file
├── QUICK_START.md              ← Start here for common tasks
├── REFACTORING_NOTES.md        ← Detailed documentation
├── PLUGIN_TEMPLATE.lua         ← Template for new plugins
│
└── lua/plugins/                ← All plugin configs (28 files)
    ├── alpha-nvim.lua
    ├── telescope.lua
    ├── lspconfig.lua
    └── ... (25 more plugins)
```

## 🎯 What Changed

| Aspect | Before | After |
|--------|--------|-------|
| **init.lua size** | 1,385 lines | 167 lines |
| **Plugin organization** | All in one file | 28 separate files |
| **Finding a plugin** | Scroll through 1000s of lines | Open `plugins/name.lua` |
| **Adding a plugin** | Edit init.lua | Create new file |
| **Removing a plugin** | Delete from init.lua | Delete the file |

## 📋 Plugin Categories

All 28 plugins organized by category:

**Git & Version Control** (5 plugins)
- gitsigns, neogit, gitlab, gitlinker, blame

**Navigation & UI** (7 plugins)
- telescope, neo-tree, barbar, alpha, dropbar, which-key, tokyonight

**LSP & Completion** (3 plugins)
- lspconfig, nvim-cmp, conform

**Editing & Enhancement** (10 plugins)
- nvim-treesitter, mini, nvim-ufo, nvim-autopairs, debugprint, hover, smear-cursor, split-term, todo-comments, nvim-puppeteer

**Utilities** (3 plugins)
- vim-sleuth, diffview, tiny-inline-diagnostic

## 💡 Common Commands

```vim
" Lazy.nvim commands
:Lazy                  " Open plugin manager UI
:Lazy sync            " Install/update all plugins
:Lazy clean           " Remove unused plugins

" Neovim commands
:checkhealth          " Check configuration
:messages             " View error messages
:Tutor                " Learn Neovim basics
```

## 🔧 Next Steps

1. **Read QUICK_START.md** - Learn how to manage plugins
2. **Explore lua/plugins/** - Look at existing plugin configs
3. **Customize as needed** - Edit plugin files to your liking
4. **Add new plugins** - Create new files in lua/plugins/

## ❓ Troubleshooting

**Plugin not loading?**
- Check it's in `lua/plugins/` directory
- Run `:Lazy` to see status
- Check `:messages` for errors

**Want to restore original?**
```bash
cp ~/.config/nvim/init.lua.original ~/.config/nvim/init.lua
```

**Need help?**
- See QUICK_START.md for common questions
- See REFACTORING_NOTES.md for details
- Use `:checkhealth` in Neovim

## 🎓 Learning Resources

- Neovim Help: `:help` in Neovim
- Lazy.nvim Docs: https://github.com/folke/lazy.nvim
- Kickstart.nvim: https://github.com/nvim-kickstart/nvim-kickstart

---

**Happy Neovim configuring!** 🎉

Your configuration is now modular, maintainable, and ready to customize.
