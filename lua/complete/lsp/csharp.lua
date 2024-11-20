local lspconfig = require("lspconfig")

return {
    setup = function(capabilities)
        lspconfig.omnisharp.setup {
            capabilities = capabilities,
            cmd = { "dotnet", "/home/jburke/.local/bin/Omnisharp/OmniSharp.dll" }
        }
    end
}
