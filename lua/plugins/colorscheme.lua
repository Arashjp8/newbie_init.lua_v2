return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			background = {
				light = "latte",
				dark = "mocha",
			},
			color_overrides = {
				latte = {
					rosewater = "#c14a4a",
					flamingo = "#c14a4a",
					red = "#c14a4a",
					maroon = "#c14a4a",
					pink = "#945e80",
					mauve = "#945e80",
					peach = "#c35e0a",
					yellow = "#b47109",
					green = "#6c782e",
					teal = "#4c7a5d",
					sky = "#4c7a5d",
					sapphire = "#4c7a5d",
					blue = "#45707a",
					lavender = "#45707a",
					text = "#654735",
					subtext1 = "#73503c",
					subtext0 = "#805942",
					overlay2 = "#8c6249",
					overlay1 = "#8c856d",
					overlay0 = "#a69d81",
					surface2 = "#bfb695",
					surface1 = "#d1c7a3",
					surface0 = "#e3dec3",
					base = "#f9f5d7",
					mantle = "#f0ebce",
					crust = "#e8e3c8",
				},
				mocha = {
					rosewater = "#ea6962",
					flamingo = "#ea6962",
					red = "#ea6962",
					maroon = "#ea6962",
					pink = "#d3869b",
					mauve = "#d3869b",
					peach = "#e78a4e",
					yellow = "#d8a657",
					green = "#a9b665",
					teal = "#89b482",
					sky = "#89b482",
					sapphire = "#89b482",
					blue = "#7daea3",
					lavender = "#7daea3",
					text = "#ebdbb2",
					subtext1 = "#d5c4a1",
					subtext0 = "#bdae93",
					overlay2 = "#a89984",
					overlay1 = "#928374",
					overlay0 = "#595959",
					surface2 = "#4d4d4d",
					surface1 = "#404040",
					surface0 = "#292929",
					base = "#1d2021",
					mantle = "#191b1c",
					crust = "#141617",
				},
			},
			transparent_background = false,
			show_end_of_buffer = false,
			integration_default = false,
			no_bold = true,
			no_italic = false,
			no_underline = false,
			integrations = {
				barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
				cmp = true,
				gitsigns = true,
				hop = true,
				illuminate = { enabled = true },
				native_lsp = { enabled = true, inlay_hints = { background = true } },
				neogit = true,
				neotree = true,
				semantic_tokens = true,
				treesitter = true,
				treesitter_context = true,
				vimwiki = true,
				which_key = true,
				aerial = true,
				fidget = true,
				mason = true,
				neotest = true,
				dap_ui = true,
				telescope = {
					enabled = true,
					-- style = "nvchad",
				},
			},
			highlight_overrides = {
				all = function(colors)
					return {
						CmpItemMenu = { fg = colors.surface2 },
						CursorLineNr = { fg = colors.text },
						FloatBorder = { bg = colors.base, fg = colors.surface0 },
						GitSignsChange = { fg = colors.peach },
						LineNr = { fg = colors.overlay0 },
						LspInfoBorder = { link = "FloatBorder" },
						NeoTreeDirectoryIcon = { fg = colors.subtext1 },
						NeoTreeDirectoryName = { fg = colors.subtext1 },
						NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
						NeoTreeGitConflict = { fg = colors.red },
						NeoTreeGitDeleted = { fg = colors.red },
						NeoTreeGitIgnored = { fg = colors.overlay0 },
						NeoTreeGitModified = { fg = colors.peach },
						NeoTreeGitStaged = { fg = colors.green },
						NeoTreeGitUnstaged = { fg = colors.red },
						NeoTreeGitUntracked = { fg = colors.green },
						NeoTreeIndent = { fg = colors.surface1 },
						NeoTreeNormal = { bg = colors.mantle },
						NeoTreeNormalNC = { bg = colors.mantle },
						NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
						NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
						NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
						NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
						NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
						NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
						NormalFloat = { bg = colors.base },
						Pmenu = { bg = colors.mantle, fg = "" },
						PmenuSel = { bg = colors.surface0, fg = "" },
						VertSplit = { bg = colors.base, fg = colors.surface0 },
						WhichKeyFloat = { bg = colors.mantle },
						YankHighlight = { bg = colors.surface2 },
						FidgetTask = { fg = colors.subtext1 },
						FidgetTitle = { fg = colors.peach },
						IblIndent = { fg = colors.surface0 },
						IblScope = { fg = colors.overlay0 },
						Boolean = { fg = colors.mauve },
						Number = { fg = colors.mauve },
						Float = { fg = colors.mauve },
						PreProc = { fg = colors.mauve },
						PreCondit = { fg = colors.mauve },
						Define = { fg = colors.mauve },
						-- the default one for Include was mauve
						Include = { fg = colors.red },
						Conditional = { fg = colors.red },
						Repeat = { fg = colors.red },
						Keyword = { fg = colors.red },
						Typedef = { fg = colors.red },
						Exception = { fg = colors.red },
						Statement = { fg = colors.red },
						Error = { fg = colors.red },
						StorageClass = { fg = colors.peach },
						Tag = { fg = colors.peach },
						Label = { fg = colors.peach },
						Structure = { fg = colors.peach },
						Operator = { fg = colors.peach },
						Title = { fg = colors.peach },
						Special = { fg = colors.yellow },
						SpecialChar = { fg = colors.yellow },
						Type = { fg = colors.yellow, style = { "bold" } },
						Function = { fg = colors.green, style = { "bold" } },
						Delimiter = { fg = colors.subtext1 },
						Ignore = { fg = colors.subtext1 },
						Macro = { fg = colors.teal },
						TSAnnotation = { fg = colors.mauve },
						TSAttribute = { fg = colors.mauve },
						TSBoolean = { fg = colors.mauve },
						TSCharacter = { fg = colors.teal },
						TSCharacterSpecial = { link = "SpecialChar" },
						TSComment = { link = "Comment" },
						TSConditional = { fg = colors.red },
						TSConstBuiltin = { fg = colors.mauve },
						TSConstMacro = { fg = colors.mauve },
						TSConstant = { fg = colors.text },
						TSConstructor = { fg = colors.green },
						TSDebug = { link = "Debug" },
						TSDefine = { link = "Define" },
						TSEnvironment = { link = "Macro" },
						TSEnvironmentName = { link = "Type" },
						TSError = { link = "Error" },
						TSException = { fg = colors.red },
						TSField = { fg = colors.blue },
						TSFloat = { fg = colors.mauve },
						TSFuncBuiltin = { fg = colors.green },
						TSFuncMacro = { fg = colors.green },
						TSFunction = { fg = colors.green },
						TSFunctionCall = { fg = colors.green },
						TSInclude = { fg = colors.red },
						TSKeyword = { fg = colors.red },
						TSKeywordFunction = { fg = colors.red },
						TSKeywordOperator = { fg = colors.peach },
						TSKeywordReturn = { fg = colors.red },
						TSLabel = { fg = colors.peach },
						TSLiteral = { link = "String" },
						TSMath = { fg = colors.blue },
						TSMethod = { fg = colors.green },
						TSMethodCall = { fg = colors.green },
						TSNamespace = { fg = colors.yellow },
						TSNone = { fg = colors.text },
						TSNumber = { fg = colors.mauve },
						TSOperator = { fg = colors.peach },
						TSParameter = { fg = colors.text },
						TSParameterReference = { fg = colors.text },
						TSPreProc = { link = "PreProc" },
						TSProperty = { fg = colors.blue },
						TSPunctBracket = { fg = colors.text },
						TSPunctDelimiter = { link = "Delimiter" },
						TSPunctSpecial = { fg = colors.text },
						TSRepeat = { fg = colors.red },
						TSStorageClass = { fg = colors.peach },
						TSStorageClassLifetime = { fg = colors.peach },
						TSStrike = { fg = colors.subtext1 },
						TSString = { fg = colors.teal },
						TSStringEscape = { fg = colors.green },
						TSStringRegex = { fg = colors.green },
						TSStringSpecial = { link = "SpecialChar" },
						TSSymbol = { fg = colors.text },
						TSTag = { fg = colors.peach },
						TSTagAttribute = { fg = colors.green },
						TSTagDelimiter = { fg = colors.green },
						TSText = { fg = colors.green },
						TSTextReference = { link = "Constant" },
						TSTitle = { link = "Title" },
						TSTodo = { link = "Todo" },
						TSType = { fg = colors.yellow, style = { "bold" } },
						TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
						TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
						TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
						TSURI = { fg = colors.blue },
						TSVariable = { fg = colors.text },
						TSVariableBuiltin = { fg = colors.mauve },
						["@annotation"] = { link = "TSAnnotation" },
						["@attribute"] = { link = "TSAttribute" },
						["@boolean"] = { link = "TSBoolean" },
						["@character"] = { link = "TSCharacter" },
						["@character.special"] = { link = "TSCharacterSpecial" },
						["@comment"] = { link = "TSComment" },
						["@conceal"] = { link = "Grey" },
						["@conditional"] = { link = "TSConditional" },
						["@constant"] = { link = "TSConstant" },
						["@constant.builtin"] = { link = "TSConstBuiltin" },
						["@constant.macro"] = { link = "TSConstMacro" },
						["@constructor"] = { link = "TSConstructor" },
						["@debug"] = { link = "TSDebug" },
						["@define"] = { link = "TSDefine" },
						["@error"] = { link = "TSError" },
						["@exception"] = { link = "TSException" },
						["@field"] = { link = "TSField" },
						["@float"] = { link = "TSFloat" },
						["@function"] = { link = "TSFunction" },
						["@function.builtin"] = { link = "TSFuncBuiltin" },
						["@function.call"] = { link = "TSFunctionCall" },
						["@function.macro"] = { link = "TSFuncMacro" },
						["@include"] = { link = "TSInclude" },
						["@keyword"] = { link = "TSKeyword" },
						["@keyword.function"] = { link = "TSKeywordFunction" },
						["@keyword.operator"] = { link = "TSKeywordOperator" },
						["@keyword.return"] = { link = "TSKeywordReturn" },
						["@label"] = { link = "TSLabel" },
						["@math"] = { link = "TSMath" },
						["@method"] = { link = "TSMethod" },
						["@method.call"] = { link = "TSMethodCall" },
						["@namespace"] = { link = "TSNamespace" },
						["@none"] = { link = "TSNone" },
						["@number"] = { link = "TSNumber" },
						["@operator"] = { link = "TSOperator" },
						["@parameter"] = { link = "TSParameter" },
						["@parameter.reference"] = { link = "TSParameterReference" },
						["@preproc"] = { link = "TSPreProc" },
						["@property"] = { link = "TSProperty" },
						["@punctuation.bracket"] = { link = "TSPunctBracket" },
						["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
						["@punctuation.special"] = { link = "TSPunctSpecial" },
						["@repeat"] = { link = "TSRepeat" },
						["@storageclass"] = { link = "TSStorageClass" },
						["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
						["@strike"] = { link = "TSStrike" },
						["@string"] = { link = "TSString" },
						["@string.escape"] = { link = "TSStringEscape" },
						["@string.regex"] = { link = "TSStringRegex" },
						["@string.special"] = { link = "TSStringSpecial" },
						["@symbol"] = { link = "TSSymbol" },
						["@tag"] = { link = "TSTag" },
						["@tag.attribute"] = { link = "TSTagAttribute" },
						["@tag.delimiter"] = { link = "TSTagDelimiter" },
						["@text"] = { link = "TSText" },
						["@text.danger"] = { link = "TSDanger" },
						["@text.diff.add"] = { link = "diffAdded" },
						["@text.diff.delete"] = { link = "diffRemoved" },
						["@text.emphasis"] = { link = "TSEmphasis" },
						["@text.environment"] = { link = "TSEnvironment" },
						["@text.environment.name"] = { link = "TSEnvironmentName" },
						["@text.literal"] = { link = "TSLiteral" },
						["@text.math"] = { link = "TSMath" },
						["@text.note"] = { link = "TSNote" },
						["@text.reference"] = { link = "TSTextReference" },
						["@text.strike"] = { link = "TSStrike" },
						["@text.strong"] = { link = "TSStrong" },
						["@text.title"] = { link = "TSTitle" },
						["@text.todo"] = { link = "TSTodo" },
						["@text.todo.checked"] = { link = "Green" },
						["@text.todo.unchecked"] = { link = "Ignore" },
						["@text.underline"] = { link = "TSUnderline" },
						["@text.uri"] = { link = "TSURI" },
						["@text.warning"] = { link = "TSWarning" },
						["@todo"] = { link = "TSTodo" },
						["@type"] = { link = "TSType" },
						["@type.builtin"] = { link = "TSTypeBuiltin" },
						["@type.definition"] = { link = "TSTypeDefinition" },
						["@type.qualifier"] = { link = "TSTypeQualifier" },
						["@uri"] = { link = "TSURI" },
						["@variable"] = { link = "TSVariable" },
						["@variable.builtin"] = { link = "TSVariableBuiltin" },
						["@lsp.type.class"] = { link = "TSType" },
						["@lsp.type.comment"] = { link = "TSComment" },
						["@lsp.type.decorator"] = { link = "TSFunction" },
						["@lsp.type.enum"] = { link = "TSType" },
						["@lsp.type.enumMember"] = { link = "TSProperty" },
						["@lsp.type.events"] = { link = "TSLabel" },
						["@lsp.type.function"] = { link = "TSFunction" },
						["@lsp.type.interface"] = { link = "TSType" },
						["@lsp.type.keyword"] = { link = "TSKeyword" },
						["@lsp.type.macro"] = { link = "TSConstMacro" },
						["@lsp.type.method"] = { link = "TSMethod" },
						["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
						["@lsp.type.namespace"] = { link = "TSNamespace" },
						["@lsp.type.number"] = { link = "TSNumber" },
						["@lsp.type.operator"] = { link = "TSOperator" },
						["@lsp.type.parameter"] = { link = "TSParameter" },
						["@lsp.type.property"] = { link = "TSProperty" },
						["@lsp.type.regexp"] = { link = "TSStringRegex" },
						["@lsp.type.string"] = { link = "TSString" },
						["@lsp.type.struct"] = { link = "TSType" },
						["@lsp.type.type"] = { link = "TSType" },
						["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
						["@lsp.type.variable"] = { link = "TSVariable" },
					}
				end,
				latte = function(colors)
					return {
						IblIndent = { fg = colors.mantle },
						IblScope = { fg = colors.surface1 },
						LineNr = { fg = colors.surface1 },
					}
				end,
			},
		})
		vim.cmd([[
          augroup CustomColors
          autocmd!
          autocmd ColorScheme * hi ColorColumn guibg=#191B1C
          augroup END
        ]])
		-- vim.cmd([[
		--     augroup CustomCursorLine
		--     autocmd!
		--     autocmd ColorScheme * hi CursorLine guibg=NONE
		--     augroup END
		-- ]])
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#eedaad" })
		vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#eedaad" })
		vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#eedaad" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#191B1C" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#191B1C", fg = "#4d4d4d" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#191B1C" })
	end,
}

-- return {
--     "navarasu/onedark.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         require("onedark").setup({
--             style = "warmer",
--             transparent = true,
--         })
--         -- Enable theme
--         require("onedark").load()
--     end,
-- }

-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				transparent_background = true,
-- 				color_overrides = {},
-- 			})
-- 			vim.cmd.colorscheme("catppuccin-mocha")
-- 		end,
-- 	},
-- }

-- return {
-- 	lazy = false,
-- 	priority = 1000,
-- 	"tjdevries/colorbuddy.nvim",
-- 	config = function()
-- 		vim.cmd.colorscheme("gruvbuddy_custom")
-- 		-- vim.cmd.colorscheme("gruvfork")
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#141617" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", {
-- 			fg = "#888888",
-- 			bg = "#141617",
-- 		})
-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#141617" })
-- 		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#888888", bg = "#141617", bold = false })
-- 		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#81a2be", bold = true })
-- 		-- #de935f
-- 		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#3e4452" })
-- 		vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#bbbbbb", bold = false })
-- 	end,
-- }

-- return {
-- 	"sainnhe/gruvbox-material",
-- 	enabled = true,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_material_transparent_background = 0
-- 		vim.g.gruvbox_material_foreground = "mix"
-- 		vim.g.gruvbox_material_background = "hard"
-- 		vim.g.gruvbox_material_ui_contrast = "high"
-- 		vim.g.gruvbox_material_float_style = "dim"
-- 		vim.g.gruvbox_material_statusline_style = "material"
-- 		vim.g.gruvbox_material_cursor = "auto"
-- 		vim.cmd([[
--         augroup CustomCursorLine
--         autocmd!
--         autocmd ColorScheme * hi CursorLine guibg=NONE
--         augroup END
--     ]])
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#191B1C" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#191B1C", fg = "#4d4d4d" })
-- 		vim.api.nvim_set_hl(0, "TSPunctBracket", { fg = "#eedaad" })
-- 	end,
-- }

-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup({
-- 			terminal_colors = true,
-- 			undercurl = false,
-- 			underline = false,
-- 			bold = false,
-- 			italic = {
-- 				strings = false,
-- 				emphasis = false,
-- 				comments = false,
-- 				operators = false,
-- 				folds = false,
-- 			},
-- 			strikethrough = true,
-- 			invert_selection = false,
-- 			invert_signs = false,
-- 			invert_tabline = false,
-- 			invert_intend_guides = false,
-- 			inverse = true,
-- 			contrast = "hard",
-- 			palette_overrides = {},
-- 			overrides = {
-- 				SignColumn = { bg = "#1C2021" },
-- 			},
-- 			dim_inactive = false,
-- 			transparent_mode = false,
-- 		})
-- 		vim.cmd.colorscheme("gruvbox")
-- 	end,
-- }

-- return {
--     "deparr/tairiki.nvim",
--     lazy = false,
--     priority = 1000, -- recommended if you use tairiki as your default theme
--     config = function()
--         require("tairiki").setup({
--             palette = "dimmed", -- main palette, available options: dark, light, dimmed, tomorrow, light_legacy
--             default_dark = "dimmed",
--             default_light = "light",
--             transparent = true,           -- don't set background colors
--             terminal = false,             -- override nvim terminal colors
--             end_of_buffer = false,        -- show end of buffer filler lines (tildes)
--             visual_bold = false,          -- bolden visual selections
--             cmp_itemkind_reverse = false, -- reverse fg/bg on nvim-cmp item kinds
--             diagnostics = {
--                 darker = false,           -- darken diagnostic virtual text
--                 background = true,        -- add background to diagnostic virtual text
--                 undercurl = false,        -- use undercurls for inline diagnostics
--             },
--             -- style for different syntactic tokens
--             -- see :help nvim_set_hl() for available keys
--             code_style = {
--                 comments = { italic = true },
--                 conditionals = {},
--                 keywords = {},
--                 functions = {},
--                 strings = {},
--                 variables = {},
--                 parameters = {},
--                 types = {},
--             },
--             -- lualine theme config
--             lualine = {
--                 transparent = true, -- remove background from center section
--             },
--             -- which plugins to enable
--             plugins = {
--                 all = false,  -- enable all supported plugins
--                 none = false, -- ONLY set groups listed in :help highlight-groups (see lua/tairiki/groups/neovim.lua). Manually enabled plugins will also be ignored
--                 auto = false, -- auto detect installed plugins, currently lazy.nvim only
--                 -- or enable/disable plugins manually
--                 -- see lua/tairiki/groups/init.lua for the full list of available plugins
--                 -- either the key or value from the M.plugins table can be used as the key here
--                 --
--                 -- setting a specific plugin manually overrides `all` and `auto`
--                 treesitter = true,
--                 semantic_tokens = true,
--             },
--             -- optional function to modify or add colors to the palette
--             -- palette definitions are in lua/tairiki/palette
--             colors = function(colors, opts) end,
--             -- optional function to override highlight groups
--             highlights = function(groups, colors, opts) end,
--         })
--         vim.cmd.colorscheme("tairiki")
--     end,
-- }

-- return {
-- 	"gmr458/vscode_modern_theme.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("vscode_modern").setup({
-- 			cursorline = true,
-- 			transparent_background = true,
-- 			nvim_tree_darker = true,
-- 		})
-- 		vim.cmd.colorscheme("vscode_modern")
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.typescriptreact", { bg = "NONE", fg = "#cccccc" })
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.local.typescriptreact", { bg = "NONE", fg = "#cccccc" })
-- 		vim.api.nvim_set_hl(0, "@lsp.type.variable.typescriptreact", { bg = "NONE", fg = "#cccccc" })
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.local.typescript", { bg = "NONE", fg = "#cccccc" })
-- 		vim.api.nvim_set_hl(0, "@lsp.type.variable.typescript", { bg = "NONE", fg = "#cccccc" })
-- 		vim.api.nvim_set_hl(0, "@variable", { bg = "NONE", fg = "#cccccc" })
-- 		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#90CAE9", bold = true })
-- 		local bgColor = "#1D1F21"
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = bgColor })
-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = bgColor })
-- 	end,
-- }

-- return {
--     "Mofiqul/vscode.nvim",
--     priority = 1000,
--     config = function()
--         require("vscode").setup({
--             transparent = true,
--         })
--         vim.cmd([[
--       augroup CustomColors
--       autocmd!
--       autocmd ColorScheme * hi ColorColumn guibg=#181818
--       augroup END
--     ]])
--         vim.cmd([[
--         augroup CustomCursorLine
--         autocmd!
--         autocmd ColorScheme * hi CursorLine guibg=NONE
--         augroup END
--     ]])
--         vim.cmd.colorscheme("vscode")
--         vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = "#FFFFFF" })
--         vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#555555" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "NONE" })
--         vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.typescriptreact", { bg = "NONE", fg = "#cccccc" })
--         vim.api.nvim_set_hl(0, "@lsp.typemod.variable.local.typescriptreact", { bg = "NONE", fg = "#cccccc" })
--         vim.api.nvim_set_hl(0, "@lsp.type.variable.typescriptreact", { bg = "NONE", fg = "#cccccc" })
--         vim.api.nvim_set_hl(0, "@lsp.typemod.variable.local.typescript", { bg = "NONE", fg = "#cccccc" })
--         vim.api.nvim_set_hl(0, "@lsp.type.variable.typescript", { bg = "NONE", fg = "#cccccc" })
--         vim.api.nvim_set_hl(0, "@variable", { bg = "NONE", fg = "#cccccc" })
--     end,
-- }

-- return {
--     "projekt0n/github-nvim-theme",
--     name = "github-theme",
--     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         -- Default options
--         require("github-theme").setup({
--             options = {
--                 -- Compiled file's destination location compile_path = vim.fn.stdpath("cache") .. "/github-theme",
--                 compile_file_suffix = "_compiled", -- Compiled file suffix
--                 hide_end_of_buffer = true,         -- Hide the '~' character at the end of the buffer for a cleaner look
--                 hide_nc_statusline = true,         -- Override the underline style for non-active statuslines
--                 transparent = true,                -- Disable setting bg (make neovim's background transparent)
--                 terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in :terminal
--                 dim_inactive = false,              -- Non focused panes set to alternative background
--                 module_default = true,             -- Default enable value for modules
--                 styles = {
--                     comments = "NONE",
--                     functions = "NONE",
--                     keywords = "NONE",
--                     variables = "NONE",
--                     conditionals = "NONE",
--                     constants = "NONE",
--                     numbers = "NONE",
--                     operators = "NONE",
--                     strings = "NONE",
--                     types = "NONE",
--                 },
--             },
--         })
--         vim.cmd([[
--       augroup CustomColors
--       autocmd!
--       autocmd ColorScheme * hi ColorColumn guibg=#14171C
--       augroup END
--     ]])
--         vim.cmd([[
--         augroup CustomCursorLine
--         autocmd!
--         autocmd ColorScheme * hi CursorLine guibg=NONE
--         "autocmd ColorScheme * hi CursorLine guibg=#171B22
--         augroup END
--     ]])
--         -- vim.cmd("colorscheme github_light_default")
--         vim.cmd("colorscheme github_dark_default")
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#14171C" })
--         vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#565f89", bg = "NONE" })
--         vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#14171C" })
--         vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#565f89", bg = "#14171C" })
--         -- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#F78166", bold = true })
--         vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#77BDFB", bold = true })
--         vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#3e4452" })
--         vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#77BDFB", bold = true })
--     end,
-- }

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         require("tokyonight").setup({
--             on_highlights = function() end,
--             transparent = false,
--             style = "night",
--             styles = {
--                 keywords = { italic = false },
--                 comments = { italic = false },
--                 floats = "dark",
--             },
--             on_colors = function() end,
--         })
--         vim.cmd([[
--         augroup CustomColors
--         autocmd!
--         autocmd ColorScheme * hi ColorColumn guibg=#16161E
--         "autocmd ColorScheme * hi ColorColumn guibg=#1A1B26
--         "autocmd ColorScheme * hi ColorColumn guibg=#05070D
--         augroup END
--       ]])
--         vim.cmd([[
--         augroup CustomCursorLine
--         autocmd!
--         autocmd ColorScheme * hi CursorLine guibg=NONE
--         autocmd ColorScheme * hi CursorLineNr guifg=#a9b1d6 guibg=NONE
--         augroup END
--     ]])
--         vim.cmd("colorscheme tokyonight")
--         vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#0db9d7", bg = "NONE" })
--     end,
-- }
