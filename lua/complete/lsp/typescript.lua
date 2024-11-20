local lspconfig = require("lspconfig")
local lsp_util = require("lspconfig.util")

return {
    setup = function(capabilities)
        lspconfig.ts_ls.setup {
            capabilities = capabilities,
            root_dir = function (fname)
                return lsp_util.root_pattern("nx.json")(fname) or lsp_util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
            end
        }
    end
}
