local api = require("minimal.api")

api.keymap({ mode = api.Modes.Insert, shortcut = "jj", action = "<esc>" })
