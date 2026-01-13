---@type LazySpec
return {
  { 'github/copilot.vim' },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
    require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,        -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,              -- Function to run after the scrolling animation ends
          })
    end
  },
  { "aserowy/tmux.nvim",
    config = function() require("tmux").setup({
        copy_sync = {
            -- enables copy sync. by default, all registers are synchronized.
            -- to control which registers are synced, see the `sync_*` options.
            enable = true,
            -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
            -- first buffer or named_buffer_name = true to ignore a named tmux
            -- buffer with name named_buffer_name :)
            ignore_buffers = { empty = false },
            -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
            -- clipboard by tmux
            redirect_to_clipboard = false,
            -- offset controls where register sync starts
            -- e.g. offset 2 lets registers 0 and 1 untouched
            register_offset = 0,
            -- overwrites vim.g.clipboard to redirect * and + to the system
            -- clipboard using tmux. If you sync your system clipboard without tmux,
            -- disable this option!
            sync_clipboard = true,
            -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
            sync_registers = true,
            -- syncs deletes with tmux clipboard as well, it is adviced to
            -- do so. Nvim does not allow syncing registers 0 and 1 without
            -- overwriting the unnamed register. Thus, ddp would not be possible.
            sync_deletes = true,
            -- syncs the unnamed register with the first buffer entry from tmux.
            sync_unnamed = true,
        },
        navigation = {
            -- cycles to opposite pane while navigating into the border
            cycle_navigation = false,
            -- enables default keybindings (C-hjkl) for normal mode
            enable_default_keybindings = true,
            -- prevents unzoom tmux when navigating beyond vim border
            persist_zoom = true,
        },
        resize = {
            -- enables default keybindings (A-hjkl) for normal mode
            enable_default_keybindings = true,
            -- sets resize steps for x axis
            resize_step_x = 1,
            -- sets resize steps for y axis
            resize_step_y = 1,
        }
    })
    end
  },
  {
    -- Grug Far search and replace
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      });
    end
  },
  { 'EdenEast/nightfox.nvim' },
  -- {
  --   "NickvanDyke/opencode.nvim",
  --   dependencies = {
  --     -- Recommended for `ask()` and `select()`.
  --     -- Required for `snacks` provider.
  --     ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
  --     { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  --   },
  --   config = function()
  --     ---@type opencode.Opts
  --     vim.g.opencode_opts = {
  --       -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
  --     }
  --
  --     -- Required for `opts.auto_reload`.
  --     vim.o.autoread = true
  --
  --     -- Recommended/example keymaps.
  --     vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
  --     vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
  --     vim.keymap.set({ "n", "x" },    "ga", function() require("opencode").prompt("@this") end,                   { desc = "Add to opencode" })
  --     vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })
  --     vim.keymap.set("n",        "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
  --     vim.keymap.set("n",        "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })
  --     -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
  --     vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
  --     vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
  --   end,
  -- },
  {
    'tadaa/vimade',
    opts = {
      -- Recipe can be any of 'default', 'minimalist', 'duo', and 'ripple'
      -- Set animate = true to enable animations on any recipe.
      -- See the docs for other config options.
      recipe = {'default', {animate=true}},
      -- ncmode = 'windows' will fade inactive windows.
      -- ncmode = 'focus' will only fade after you activate the `:VimadeFocus` command.
      ncmode = 'windows',
      fadelevel = 0.7, -- any value between 0 and 1. 0 is hidden and 1 is opaque.
      -- Changes the real or theoretical background color. basebg can be used to give
      -- transparent terminals accurating dimming.  See the 'Preparing a transparent terminal'
      -- section in the README.md for more info.
      -- basebg = [23,23,23],
      basebg = '',
      tint = {
        bg = {rgb={0,0,0}, intensity=0.3}, -- adds 30% black to background
        -- fg = {rgb={0,0,255}, intensity=0.3}, -- adds 30% blue to foreground
        -- fg = {rgb={120,120,120}, intensity=1}, -- all text will be gray
        -- sp = {rgb={255,0,0}, intensity=0.5}, -- adds 50% red to special characters
        -- you can also use functions for tint or any value part in the tint object
        -- to create window-specific configurations
        -- see the `Tinting` section of the README for more details.
      },
    },
  },
  {
    'preservim/vim-markdown',
    branch = 'master',
    dependencies = {'godlygeek/tabular'},
    config = function() vim.opt.conceallevel = 2 end,
  },
  {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
            -- your custom config here (optional)
        })
    end,
  },
  -- {
  --   "3rd/image.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "luarocks.nvim", -- Required to install image manipulation rocks
  --   },
  --   opts = {
  --     backend = "kitty", -- Change to "ueberzug" if not using Kitty/WezTerm
  --     integrations = {
  --       markdown = {
  --         enabled = true,
  --         clear_in_insert_mode = false,
  --         download_remote_images = true,
  --         only_render_image_at_cursor = false,
  --         filetypes = { "markdown", "vimwiki", "quarto" },
  --       },
  --     },
  --     max_width = 100,
  --     max_height = 12,
  --     max_width_window_percentage = math.huge,
  --     max_height_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true, -- prevents images from bleeding through windows
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   },
  -- },
  -- -- Helper to manage Lua dependencies for image.nvim
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  -- },
  -- {
  --   "HakonHarnes/img-clip.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     default = {
  --       dir_path = "assets", -- Where to save images
  --       prompt_for_file_name = false, -- Don't ask for a name, just auto-generate
  --       use_absolute_path = false,
  --     },
  --   },
  --   keys = {
  --     { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  --   },
  -- },
  {
    "duckdm/neowarrior.nvim",
    event = "VeryLazy", -- Loads the plugin lazily to keep startup fast
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Required for interactive picking
      "folke/noice.nvim",            -- Optional: for a cleaner command-line UI
    },
    config = function()
      local nw = require("neowarrior")

      nw.setup({
        -- The report to use by default (e.g., "next", "minimal", "ready")
        report = "next",

        -- Default filter (e.g., only show tasks due soon or without a date)
        filter = "(due.before:2d or due: )",

        -- Optional: Directory-specific task configurations
        -- Useful if you want different filters for work vs. personal folders
        dir_setup = {
          {
            dir = vim.env.HOME .. "/projects/work",
            filter = "project:Work",
            mode = "tree",
            expanded = true,
          },
        },
      })

      -- KEYBINDINGS
      -- Custom leader mappings to open the Taskwarrior dashboard
      vim.keymap.set("n", "<leader>tw", function() nw.open_float() end, { desc = "Taskwarrior: Floating" })
      vim.keymap.set("n", "<leader>tl", function() nw.open_left() end,  { desc = "Taskwarrior: Left Sidebar" })
      vim.keymap.set("n", "<leader>tr", function() nw.open_right() end, { desc = "Taskwarrior: Right Sidebar" })
    end,
  }
}
