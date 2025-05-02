return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      prompts = {
        Rename = {
          prompt = 'Rename the following variable based on the context',
          selection = function(source)
            local select = require 'CopilotChat.select'
            return select.visual(source)
          end,
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
    {
      'CopilotC-Nvim/copilot-chat-cmp.nvim',
      dependencies = { 'hrsh7th/nvim-cmp' },
      config = function()
        require('copilot.chat.cmp').setup()
      end,
    },
    keys = {
      { '<leader>zc', ':CopilotChat<CR>', mode = 'n', desc = 'chat with copilot' },
      { '<leader>ze', ':CopilotChatExplain<CR>', mode = 'v', desc = 'Explain code' },
      { '<leader>zr', ':CopilotChatReview<CR>', mode = 'v', desc = 'Review code' },
      { '<leader>zf', ':CopilotChatFix<CR>', mode = 'v', desc = 'Fix code issues' },
      { '<leader>zo', ':CopilotChatOptimize<CR>', mode = 'v', desc = 'Optimize code' },
      { '<leader>zd', ':CopilotChatDocs<CR>', mode = 'v', desc = 'Generate docs' },
      { '<leader>zt', ':CopilotChatTest<CR>', mode = 'v', desc = 'Generate Tests' },
      { '<leader>zm', ':CopilotChatCommit<CR>', mode = 'n', desc = 'Generate Commit Message' },
      { '<leader>zs', ':CopilotChatCommit<CR>', mode = 'v', desc = 'Generate Commit for Selection' },
    },
  },
}
