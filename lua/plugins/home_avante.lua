-- Not for work
if vim.env.VIM_ENV == "work" then return {} end

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      provider = "openai",
      -- The NEW way: all provider details must be nested in 'providers'
      providers = {
        openai = {
          endpoint = "http://ai-node:8000/v1",
          model = "qwen3-coder-30b",
          timeout = 30000,
          api_key_name = "VLLM_API_KEY",
          -- Temperature and max_tokens moved to extra_request_body
          extra_request_body = {
            temperature = 0.1,
            max_tokens = 4096,
          },
        },
      },
    },
    -- Dependencies remain the same
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
