require("colorbuddy").colorscheme("gruvbuddy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

-- Softer base text color
Color.new("white", "#e0e0d0")
Color.new("superwhite", "#a8a8a8")

-- Muted base color palette
Color.new("red", "#b25c5c")
Color.new("pink", "#c79a57")
Color.new("green", "#7fa77c")
Color.new("yellow", "#c4a14f")
Color.new("blue", "#709bbd")
Color.new("aqua", "#7aa89f")
Color.new("cyan", "#7eb3b3")
Color.new("purple", "#a08fc3")
Color.new("violet", "#a987bc")
Color.new("orange", "#c48b5a")
Color.new("brown", "#9c7360")

-- Extra soft accents
Color.new("seagreen", "#698b69")
Color.new("turquoise", "#698b69")

-- Selection & UI
Color.new("selection", "#333539")
Color.new("columnNr", "#5e5e5e")
Color.new("comment", "#808080")

-- Base backgrounds
local background_string = "#222425" -- softened from #1c1e20
local float_background_string = "#1a1b1c"
Color.new("background", background_string)
Color.new("gray0", background_string)

-- Core groups
Group.new("Normal", c.superwhite, c.gray0)
Group.new("LineNr", c.columnNr, nil)
Group.new("CursorLineNr", c.columnNr, nil)
Group.new("Visual", c.none, c.selection, s.none)

-- Comments
Group.new("@comment", c.comment, nil, s.italic)
Group.new("Comment", c.comment, nil, s.italic)

-- Syntax
Group.new("@constant", c.orange, nil, s.none)
Group.new("@function", c.yellow:dark(), nil, s.none)
Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@keyword", c.violet:dark(), nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
Group.new("@property", c.blue)
Group.new("@variable", c.superwhite, nil)
Group.new("@variable.builtin", c.purple:light(), g.Normal)
Group.new("@type", c.orange, nil, s.none)

-- Markdown/inline
Group.new("@text.literal", c.superwhite, c.background)
Group.new("@text.literal.markdown", c.superwhite, c.background)
Group.new("@text.code", c.superwhite, c.background)
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = float_background_string, fg = "NONE" })
