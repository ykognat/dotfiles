local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }

-- Telescope keybindings
local telescope_mappings = {
    { 'n', '<leader>tk', ':Telescope keymaps<CR>' },
    { 'n', '<leader>tcc', "<cmd>lua require('telescope.builtin').colorscheme()<CR>" },
    { 'n', '<leader>tbb', ':Telescope buffers<CR>' },
    { 'n', '<leader>tf', ':Telescope find_files<CR>' },
    { 'n', '<leader>tsg', ':Telescope grep_string<CR>' },
    { 'n', '<leader>tsl', ':Telescope live_grep<CR>' },
    { 'n', '<leader>tco', ':Telescope commands<CR>' },
    { 'n', '<leader>tt', ':Telescope tags<CR>' },
    { 'n', '<leader>tm', ':Telescope man_pages<CR>' },
    { 'n', '<leader>tbf', ':Telescope current_buffer_fuzzy_find<CR>' },
    { 'n', '<leader>tlr', ':Telescope lsp_references<CR>' },
}

for _, map in ipairs(telescope_mappings) do
    vim.api.nvim_set_keymap(map[1], map[2], map[3], opts)
end

-- Visual mode Telescope keybindings
keymap('v', '<leader>tsg', function()
    local text = vim.getVisualSelection()
    tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

keymap('v', '<leader>tsl', function()
    local text = vim.getVisualSelection()
    tb.live_grep({ default_text = text })
end, opts)

-- Oil keybinding
vim.keymap.set("n", "<s-tab>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- LSP keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        local lsp_mappings = {
            { 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>' },
            { 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>' },
            { 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>' },
            { 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>' },
            { 'n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>' },
            { 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>' },
            { 'i', '<c-m-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>' },
            { 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>' },
            { 'n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>' },
            { 'n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>' },
        }

        for _, map in ipairs(lsp_mappings) do
            bufmap(map[1], map[2], map[3])
        end
    end
})

-- CodeCompanion keybindings
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", opts)
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", opts)
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", opts)

-- Command line abbreviation
vim.cmd([[cab cc CodeCompanion]])
