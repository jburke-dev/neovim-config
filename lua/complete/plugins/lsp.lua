return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "neovim/nvim-lspconfig",
        "zbirenbaum/copilot-cmp"
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup {
            mapping = {
                ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort()
            },
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' }
                },
                {
                    { name= "path" }
                },
                {
                    { name = "buffer" }
                },
                {
                    { name = "copilot" }
                }
            )
        }

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            },
            {
                { name = "cmdline" }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        require("complete.lsp").setup()
    end
}
