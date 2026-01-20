-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local gfh_actions = require("telescope").extensions.git_file_history.actions

-- Copilot Keybindings
-- vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
-- vim.keymap.set('i', '<C-h>', '<Plug>(copilot-accept-line)')

require("telescope").setup {
  -- The rest of your telescope config here

  extensions = {
    git_file_history = {
      -- Keymaps inside the picker
      mappings = {
        i = {
          ["<C-g>"] = gfh_actions.open_in_browser,
        },
        n = {
          ["<C-g>"] = gfh_actions.open_in_browser,
        },
      },

      -- The command to use for opening the browser (nil or string)
      -- If nil, it will check if xdg-open, open, start, wslview are available, in that order.
      browser_command = nil,
    },
  },
}

require("telescope").load_extension "git_file_history"
