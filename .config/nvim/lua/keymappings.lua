local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>tbb', ':Telescope buffers<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tsg', ':Telescope grep_string<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tsl', ':Telescope live_grep<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':Telescope commands<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':Telescope tags<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tm', ':Telescope man_pages<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tbf', ':Telescope current_buffer_fuzzy_find<CR>', 
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tlr', ':Telescope lsp_references<CR>', 
    { noremap = true, silent = true })
keymap('v', '<leader>tsg', function()
	local text = vim.getVisualSelection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)
keymap('v', '<leader>tsl', function()
	local text = vim.getVisualSelection()
	tb.live_grep({ default_text = text })
end, opts)

vim.keymap.set("n", "<s-tab>", "<CMD>Oil<CR>", 
    { desc = "Open parent directory" })
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

