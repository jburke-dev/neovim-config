return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "neovim/nvim-lspconfig"
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup {
            mapping = {
                ['<Enter>'] = cmp.mapping.confirm({ select = true })
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
    end
}
