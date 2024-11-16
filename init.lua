local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("minimal.opts")

-- TODO: figure out how to load complete optionally
require("lazy").setup({
    spec = {
        { import = "minimal.plugins" },
        { import = "complete.plugins" }
    }
})

require("minimal.mappings")
require("minimal.autocmds")
require("complete.ui").setup()
