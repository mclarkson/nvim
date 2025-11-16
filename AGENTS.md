# AGENTS.md - Neovim AstroNvim Configuration

## Project Overview
This project is a Neovim configuration based on AstroNvim, tailored for
efficient coding and development. It includes custom settings, plugins, and
tools to enhance the Neovim experience.
 
## Commands
- **Format**: `stylua .` (uses .stylua.toml: 2 spaces, 120 cols, Unix endings)
- **Lint**: `selene .` (uses selene.toml: neovim std, relaxed rules)
- **Type check**: Lua LSP with .luarc.json (formatting disabled)

## Code Style
- **Language**: Lua 5.1+ with Neovim globals
- **Imports**: `require "module"` or `local var = require "module"`
- **Naming**: snake_case for variables/functions, PascalCase for modules
- **Types**: EmmyLua annotations (`---@type`, `---@param`, `---@return`)
- **Formatting**: 2-space indentation, 120 column width, auto double quotes
- **Error handling**: Standard Lua patterns with pcall for risky operations
- **Comments**: Single-line `--` or block `--[[ ]]`, avoid unless necessary
- **Tables**: Consistent brace placement, trailing commas optional
- **Strings**: Prefer double quotes, single for special cases
- **Conditionals**: Standard Lua syntax, no semicolons
- **Functions**: Local functions preferred, consistent parameter naming
- **Plugins**: Lazy.nvim specs with proper opts/config separation</content>
<parameter name="filePath">/Users/mclarkson/.config/nvim/AGENTS.md
