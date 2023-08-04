lvim.plugins = {
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      -- keymap see: keymaps.lua
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection
      local opts = { remap = true, silent = true }
      -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
      vim.keymap.set("n", "s", ":HopChar1<cr>", opts)
      vim.keymap.set("n", "S", ":HopWord<cr>", opts)
      vim.keymap.set("n", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, opts)
      vim.keymap.set("n", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, opts)
    end,
  },
  { "towolf/vim-helm" },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  },
}
