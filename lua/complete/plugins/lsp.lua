return {
    'saghen/blink.cmp',
    lazy = false,

    version = 'v0.*',
    opts = {
        keymap = { preset = 'default',
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' }
        },
        nerd_font_variant = 'mono'
    },

    sources = {
        completion = {
            enabled_providers = { 'lsp', 'path', 'buffer' }
        }
    }
}
