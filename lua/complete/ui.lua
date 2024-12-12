local M = {}

function M.setup()
    local api = require("common.api")
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
    api.keymap_group({
        group_name = "telescope_copilot",
        group_shortcut = "c",
        keymaps = {
            {
                shortcut = "p",
                action = function ()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end
            }
        }
    })
end

return M
