---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>E"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },

        -- mappings seen under group name "Special"
        ["<Leader>s"] = {desc = "Special" },
        ["<Leader>sg"] = { "<cmd>GrugFar<cr>", desc = "Grug Far" },
        ["<Leader>so"] = { function() require("opencode").toggle() end, desc = "Opencode" },

        -- mappings seen under group name "Terminal"
        -- toggle ocs terminal in vertical split (github.com/mclarkson/ocs)
        ["<Leader>to"] = { function()
          if _G.ocs_terminal_open then
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" and vim.fn.bufname(buf):match("ocs") then
                vim.api.nvim_win_close(win, true)
                _G.ocs_terminal_open = false
                return
              end
            end
          else
            vim.cmd("vsplit")
            vim.cmd("terminal ocs")
            vim.cmd("startinsert")
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_create_autocmd("TermClose", {
              buffer = buf,
              callback = function() vim.cmd("close") _G.ocs_terminal_open = false end
            })
            _G.ocs_terminal_open = true
          end
       end, desc = "ToggleTerm ocs vertical split" },
      },
    },
  },
}
