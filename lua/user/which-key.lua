lvim.builtin.which_key.mappings["S"] = {
  name = "persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", lvim.icons.ui.History .. " Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", lvim.icons.ui.History .. " Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", lvim.icons.diagnostics.Error .. " Quit without saving session" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
