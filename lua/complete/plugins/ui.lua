return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 999,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function ()
        require('lualine').setup()
    end
}
