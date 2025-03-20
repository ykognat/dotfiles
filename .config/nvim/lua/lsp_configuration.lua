-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Add folding capabilities manually of nvim_ufo
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- Using your existing lspconfig variable
local lspconfig = require('lspconfig')

-- Basic servers
local basic_servers = { 'pyright', 'rust_analyzer', 'lua_ls' }
for _, ls in ipairs(basic_servers) do
    lspconfig[ls].setup({
        capabilities = capabilities
        -- other basic settings
    })
end

-- Nixd with special config
lspconfig.nixd.setup({
   capabilities = capabilities,
   on_attach = on_attach,
   settings = {
      nixd = {
         nixpkgs = {
            -- Use the flake's nixpkgs directly since we're editing a flake
            expr = "(builtins.getFlake (toString ./.)).inputs.nixpkgs"
         },
         eval = {
            enable = true,
            depth = 2
         }
      }
   }
})

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }),
}
cmp.setup.filetype({ 'codecompanion' }, {
    sources = {
        { name = 'codecompanion' },
    }
})
