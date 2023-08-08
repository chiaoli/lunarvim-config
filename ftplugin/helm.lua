require("lvim.lsp.manager").setup("helm_ls")

vim.defer_fn(function()
  if vim.lsp.get_active_clients() and next(vim.lsp.get_active_clients()) ~= nil then
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
      if client.name == "yamlls" then
        vim.lsp.stop_client(client.id)
      end
    end
  end
end, 3000)
