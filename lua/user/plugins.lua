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
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", },
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end
      })
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("go").setup({

        disable_defaults = false,                       -- true|false when true set false to all boolean settings and replace all table
        -- settings with {}
        go = "go",                                      -- go command, can be go[default] or go1.18beta1
        goimport = "gopls",                             -- goimport command, can be gopls[default] or goimport
        fillstruct = "gopls",                           -- can be nil (use fillstruct, slower) and gopls
        gofmt = "gofumpt",                              --gofmt cmd,
        max_line_len = 128,                             -- max line length in golines format, Target maximum line length for golines
        tag_transform = false,                          -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        tag_options = "json=omitempty",                 -- sets options sent to gomodifytags, i.e., json=omitempty
        gotests_template = "",                          -- sets gotests -template parameter (check gotests for details)
        gotests_template_dir = "",                      -- sets gotests -template_dir parameter (check gotests for details)
        comment_placeholder = "",                       -- comment_placeholder your cool placeholder e.g. 󰟓       
        icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
        verbose = false,                                -- output loginf in messages
        lsp_cfg = true,                                 -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false,  -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = true, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
        lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
        -- function(bufnr)
        --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
        -- end
        -- to setup a table of codelens
        lsp_diag_hdlr = true, -- hook lsp diag handler
        lsp_diag_underline = true,
        -- virtual text setup
        lsp_diag_virtual_text = { space = 0, prefix = "■" },
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
        lsp_inlay_hints = {
          enable = true,
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- Event which triggers a refersh of the inlay hints.
          -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
          -- not that this may cause higher CPU usage.
          -- This option is only respected when only_current_line and
          -- autoSetHints both are true.
          only_current_line_autocmd = "CursorHold",
          -- whether to show variable name before type hints with the inlay hints or not
          -- default: false
          show_variable_name = true,
          -- prefix for parameter hints
          parameter_hints_prefix = "󰊕 ",
          show_parameter_hints = true,
          -- prefix for all the other hints (type, chaining)
          other_hints_prefix = "=> ",
          -- whether to align to the lenght of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 6,
          -- The color of the hints
          highlight = "Comment",
        },
        gopls_cmd = nil,          -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        gopls_remote_auto = true, -- add -remote=auto to gopls
        gocoverage_sign = "█",
        sign_priority = 5,        -- change to a higher number to override other signs
        dap_debug = true,         -- set to false to disable dap
        dap_debug_keymap = true,  -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        -- windows: use visual studio keymap
        dap_debug_gui = true,                                          -- bool|table put your dap-ui setup here set to false to disable
        dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

        dap_port = 38697,                                              -- can be set to a number, if set to -1 go.nvim will pickup a random port
        dap_timeout = 15,                                              --  see dap option initialize_timeout_sec = 15,
        dap_retries = 20,                                              -- see dap option max_retries
        build_tags = "tag1,tag2",                                      -- set default build tags
        textobjects = true,                                            -- enable default text jobects through treesittter-text-objects
        test_runner = "go",                                            -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
        verbose_tests = true,                                          -- set to add verbose flag to tests deprecated, see '-v' option
        run_in_floaterm = true,                                        -- set to true to run in float window. :GoTermClose closes the floatterm
        -- float term recommend if you use richgo/ginkgo with terminal color

        floaterm = {          -- position
          posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
          width = 0.45,       -- width of float window if not auto
          height = 0.98,      -- height of float window if not auto
        },
        trouble = false,      -- true: use trouble to open quickfix
        test_efm = false,     -- errorfomat for quickfix, default mix mode, set to true will be efm only
        luasnip = false,      -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>" },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
}
