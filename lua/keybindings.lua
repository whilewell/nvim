local map = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true
}

-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', '<space>jD', ':lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<space>jd', ':lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<space>jh', ':lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<space>ji', ':lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
-- map('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- map('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- map('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- map('n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<space>jr', ':lua vim.lsp.buf.references()<CR>', opts)
map('n', '<space>jf', ':lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[e', ':lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']e', ':lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>jq', ':lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<space>jm', ':lua vim.lsp.buf.formatting()<CR>', opts)

