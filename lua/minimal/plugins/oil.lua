return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()

        local api = require("minimal.api")

        api.keymap({
            shortcut = "-",
            action = ":Oil<CR>"
        })
    end
}
