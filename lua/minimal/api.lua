local M = {}

---@enum modes
M.Modes = {
    Normal = "n",
    Visual = "v",
    Select = "s",
    Operator = "o",
    Insert = "i",
    Command = "c",
    Terminal = "t",
}

--- @class KeymapArgs
--- @field mode modes
--- @field shortcut string
--- @field action string|function
--- @field opts table
function M.keymap(args)
    local options = { noremap = true }
    if type(args.shortcut) ~= "string" then
        error("missing shortcut")
    elseif type(args.action) ~= "string" and type(args.action) ~= "function" then
        error("missing action")
    end

    if args.opts then
        options = vim.tbl_extend("force", options, args.opts)
    end

    vim.keymap.set(args.mode or M.Modes.Normal, args.shortcut, args.action, options)
end

--- @class KeymapGroupArgs
--- @field group_name string
--- @field group_shortcut string
--- @field keymaps KeymapArgs[]
function M.keymap_group(args)
    for _, keymap in ipairs(args.keymaps) do
        keymap.shortcut = "<leader>" .. args.group_shortcut .. keymap.shortcut
        M.keymap(keymap)
    end
end

return M
