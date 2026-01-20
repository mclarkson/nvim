-- For work only
if vim.env.VIM_ENV ~= "work" then return {} end

return {
  { 'github/copilot.vim' },
  {
    "felixcuello/neovim-cursor",
    cmd = { "CursorAgent", "CursorAgentNew" },
    keys = {
      { "<leader>ai", "<cmd>CursorAgent<cr>", desc = "Toggle Cursor Agent" },
      { "<leader>ai", ":CursorAgent<cr>", mode = "v", desc = "Send Selection to Cursor" },
    },
    opts = {
      command = "agent chat", -- This uses your corporate 'agent' command
      split = {
        position = "right",
        size = 0.4,
      },
    },
  },
}
