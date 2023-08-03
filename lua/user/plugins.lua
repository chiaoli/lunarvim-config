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
      -- require("hop").setup()
      local opts = { remap = true, silent = true }
      local hop = require("hop")
      local directions = require('hop.hint').HintDirection
      hop.setup()
      vim.keymap.set("n", "s", ":HopChar2<cr>", opts)
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
}
