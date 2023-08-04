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

