return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function (_, opts)
        opts = {
            servers = {
                lua_ls = require("complete.lsp.lua_ls"),
                ts_ls = require("complete.lsp.typescript"),
                omnisharp = require("complete.lsp.csharp"),
                svelte = require("complete.lsp.svelte"),
                tailwindcss = require("complete.lsp.tailwindcss"),
                yamlls = require("complete.lsp.yamlls")
            }
        }
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end
}
