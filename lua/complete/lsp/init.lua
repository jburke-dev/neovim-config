local M = {}

local api = require("minimal.api")

function M.setup()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
            vim.notify("Lsp Attached!")
            local opts = { buffer = ev.buf }

            api.keymap({ shortcut = "[d", action = vim.diagnostic.goto_prev })
            api.keymap({ shortcut = "]d", action = vim.diagnostic.goto_next })
            api.keymap({ shortcut = "gD", action = vim.lsp.buf.declaration, opts = opts })
            api.keymap({ shortcut = "gd", action = vim.lsp.buf.definition, opts = opts })
            api.keymap({ shortcut = "gi", action = vim.lsp.buf.implementation, opts = opts })
            api.keymap({ shortcut = "gr", action = vim.lsp.buf.references, opts = opts })
            api.keymap({ shortcut = "K", action = vim.lsp.buf.hover, opts = opts })
            api.keymap({ shortcut = "<leader>ac", action = vim.lsp.buf.code_action, opts = opts })
            api.keymap({ shortcut = "<leader>ar", action = vim.lsp.buf.rename, opts = opts })
        end
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    require("complete.lsp.lua_ls").setup(capabilities)
end

return M
