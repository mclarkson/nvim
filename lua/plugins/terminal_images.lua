if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      "luarocks.nvim", -- Required to install image manipulation rocks
    },
    opts = {
      backend = "kitty", -- Change to "ueberzug" if not using Kitty/WezTerm
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki", "quarto" },
        },
      },
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- prevents images from bleeding through windows
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  -- Helper to manage Lua dependencies for image.nvim
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = "assets", -- Where to save images
        prompt_for_file_name = false, -- Don't ask for a name, just auto-generate
        use_absolute_path = false,
      },
    },
    keys = {
      { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
    },
  },
}
