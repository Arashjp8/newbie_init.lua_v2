require("colorbuddy").colorscheme("gruvbuddy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("white", "#f2e5bc")
Color.new("superwhite", "#dddddd")
Color.new("red", "#cc6666")
Color.new("pink", "#D8A657")
Color.new("green", "#99cc99")
-- Color.new("yellow", "#E3B86F")
Color.new("yellow", "#D8A657")
Color.new("blue", "#81a2be")
Color.new("aqua", "#8ec07c")
Color.new("cyan", "#8abeb7")
Color.new("purple", "#8e6fbd")
Color.new("violet", "#b294bb")
Color.new("orange", "#de935f")
Color.new("brown", "#a3685a")

Color.new("seagreen", "#698b69")
Color.new("turquoise", "#698b69")

Color.new("selection", "#3C3F45")
Color.new("columnNr", "#595959")

local background_string = "#1c1e20"
local float_background_string = "#141617"
Color.new("background", background_string)
Color.new("gray0", background_string)
Group.new("Normal", c.superwhite, c.gray0)
Group.new("@constant", c.orange, nil, s.none)
Group.new("@function", c.yellow, nil, s.none)
Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@keyword", c.violet, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
Group.new("@property", c.blue)
Group.new("@variable", c.superwhite, nil)
Group.new("@variable.builtin", c.purple:light():light(), g.Normal)
-- Group.new("@function.call.lua", c.blue:dark(), nil, nil)

Group.new("@text.literal.markdown", c.superwhite, c.background)
Group.new("@text.literal", c.superwhite, c.background)
Group.new("@text.code", c.superwhite, c.background)
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = float_background_string, fg = "NONE" })

Group.new("LineNr", c.columnNr, nil)
Group.new("CursorLineNr", c.columnNr, nil)

Group.new("@type", c.orange, nil, s.none)

Group.new("Visual", c.none, c.selection, s.none)
