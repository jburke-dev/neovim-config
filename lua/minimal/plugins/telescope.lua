return {
    'nvim-telescope/telescope.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local api = require("common.api")
        local builtin = require("telescope.builtin")

        api.keymap_group({
            group_name = "telescope",
            group_shortcut = "f",
            keymaps = {
                {
                    shortcut = "f",
                    action = function()
                        builtin.find_files({
                            find_command = {
                                "rg", "--files", "--hidden", "-g", "!.git/"
                            }
                        })
                    end
                },
                {
                    shortcut = "g",
                    action = function()
                        builtin.live_grep({
                            additional_args = { "--hidden" },
                            glob_pattern = "!.git/"
                        })
                    end
                }
            }
        })

        require("telescope").setup()
    end
}
