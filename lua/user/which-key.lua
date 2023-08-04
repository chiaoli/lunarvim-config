lvim.builtin.which_key.mappings["S"] = {
  name = "persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", lvim.icons.ui.History .. " Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", lvim.icons.ui.History .. " Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", lvim.icons.diagnostics.Error .. " Quit without saving session" },
}
