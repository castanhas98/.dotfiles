-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Need to require java before lspconfig
require("java").setup()

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

require("lspconfig").jdtls.setup({})

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("i", "<C-l>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("i", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("i", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set({ "n", "x" }, "<leader>fo", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    end,
})


require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls"
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})


-- These are just examples. Replace them with the language
-- servers you have installed in your system
-- require("lspconfig").lua_ls.setup({})

-- Setup autocompletion
local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
        -- Navigate between completion items
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})
