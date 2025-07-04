-- general
lvim.format_on_save = true

-- status line
lvim.builtin.lualine.sections.lualine_a = { "mode" }

-- project
lvim.builtin.project.patterns = {
  ".git",
  "package-lock.json",
  "yarn.lock",
  "package.json",
  "requirements.txt",
  "go.mod"
}

-- fold with ufo
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Fix treesitter issues with Neovim 0.11.2
vim.g.skip_ts_context_commentstring_module = true

-- Disable indent-blankline for Go files to avoid parser errors
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    local ibl_ok, ibl = pcall(require, 'ibl')
    if ibl_ok then
      ibl.setup_buffer(0, { enabled = false })
    end
  end,
})
