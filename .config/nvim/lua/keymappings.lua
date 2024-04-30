vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<c-w>-', ':vertical resize -5<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<c-w>=', ':vertical resize +5<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<c-w>,', ':resize -5<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<c-w>.', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_create_user_command(
    "SaveAs",
    function(opts)
      SaveAsUser(opts.args)
    end,
    {
      nargs = 1,
      desc = "Save the current file as a specified user"
    }
)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('i', '<c-m-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    -- bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end})
