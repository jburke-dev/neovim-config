return {
    'nvim-neorg/neorg',
    lazy = false,
    version = "*",
    dependencies = { "luarocks.nvim", "nvim-treesitter/nvim-treesitter" },
    after = "nvim-treesitter",
    config = function ()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.dirman"] = {
                    config = {
                        default_workspace = "v1",
                        workspaces = {
                            v1 = "~/Knowledge/neorg/v1"
                        }
                    }
                },
                ["core.concealer"] = {}
            }
        })
    end
}
