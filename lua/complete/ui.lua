local M = {}

function M.setup()
    local api = require("minimal.api")
    local builtin = require("telescope.builtin")

    api.keymap_group({
        group_name = "telescope_advanced",
        group_shortcut = "f",
        keymaps = {
            {
                shortcut = "d",
                action = builtin.diagnostics,
            },
            {
                shortcut = "k",
                action = builtin.keymaps
            },
            {
                shortcut = "s",
                action = builtin.lsp_document_symbols
            }
        }
    })
end

return M
