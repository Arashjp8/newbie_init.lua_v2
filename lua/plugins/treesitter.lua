---------------------------------------------------------------------
-- Plugin Configuration: nvim-treesitter
---------------------------------------------------------------------
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---------------------------------------------------------------------
		-- Treesitter Configuration
		---------------------------------------------------------------------
		local config = require("nvim-treesitter.configs")
		config.setup({
			modules = {},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			ensure_installed = {
				"vimdoc",
				"lua",
				"markdown",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"jsdoc",
				"yaml",
				"json",
				"bash",
				"sql",
				"go",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				custom_captures = {},
			},
			indent = { enable = true },
		})

		---------------------------------------------------------------------
		-- Auto Commands for Custom Highlights
		---------------------------------------------------------------------
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				if vim.g.colors_name == "vscode" then
					-- vscNone = 'NONE'
					-- vscFront = '#D4D4D4'
					-- vscBack = '#1F1F1F'

					-- vscTabCurrent = '#1F1F1F'
					-- vscTabOther = '#2D2D2D'
					-- vscTabOutside = '#252526'

					-- vscLeftDark = '#252526'
					-- vscLeftMid = '#373737'
					-- vscLeftLight = '#636369'

					-- vscPopupFront = '#BBBBBB'
					-- vscPopupBack = '#272727'
					-- vscPopupHighlightBlue = '#004b72'
					-- vscPopupHighlightGray = '#343B41'

					-- vscSplitLight = '#898989'
					-- vscSplitDark = '#444444'
					-- vscSplitThumb = '#424242'

					-- vscCursorDarkDark = '#222222'
					-- vscCursorDark = '#51504F'
					-- vscCursorLight = '#AEAFAD'
					-- vscSelection = '#264F78'
					-- vscLineNumber = '#5A5A5A'

					-- vscDiffRedDark = '#4B1818'
					-- vscDiffRedLight = '#6F1313'
					-- vscDiffRedLightLight = '#FB0101'
					-- vscDiffGreenDark = '#373D29'
					-- vscDiffGreenLight = '#4B5632'
					-- vscSearchCurrent = '#515c6a'
					-- vscSearch = '#613315'

					-- vscGitAdded = '#81b88b'
					-- vscGitModified = '#e2c08d'
					-- vscGitDeleted = '#c74e39'
					-- vscGitRenamed = '#73c991'
					-- vscGitUntracked = '#73c991'
					-- vscGitIgnored = '#8c8c8c'
					-- vscGitStageModified = '#e2c08d'
					-- vscGitStageDeleted = '#c74e39'
					-- vscGitConflicting = '#e4676b'
					-- vscGitSubmodule = '#8db9e2'

					-- vscContext = '#404040'
					-- vscContextCurrent = '#707070'

					-- vscFoldBackground = '#202d39'

					-- Syntax colors
					-- vscGray = '#808080'
					-- vscViolet = '#646695'
					-- vscBlue = '#569CD6'
					-- vscAccentBlue = '#4FC1FF'
					-- vscDarkBlue = '#223E55'
					-- vscMediumBlue = '#18a2fe'
					-- vscDisabledBlue = '#729DB3'
					-- vscLightBlue = '#9CDCFE'
					-- vscGreen = '#6A9955'
					-- vscBlueGreen = '#4EC9B0'
					-- vscLightGreen = '#B5CEA8'
					-- vscRed = '#F44747'
					-- vscOrange = '#CE9178'
					-- vscLightRed = '#D16969'
					-- vscYellowOrange = '#D7BA7D'
					-- vscYellow = '#DCDCAA'
					-- vscDarkYellow = '#FFD602'
					-- vscPink = '#C586C0'

					-- Low contrast with default background
					-- vscDimHighlight = '#51504F'
					vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#4EC9B0" })
				end
				if
					vim.g.colors_name == "github_dark"
					or vim.g.colors_name == "github_dark_high_contrast"
					or vim.g.colors_name == "github_dark_dimmed"
				then
					-- NOTE: this is only for github dark theme
					-- #0D1117
					-- #161B22
					-- #21262D
					-- #89929B
					-- #C6CDD5
					-- #ECF2F8
					-- #FA7970
					-- #FAA356
					-- #7CE38B
					-- #A2D2FB
					-- #77BDFB
					-- #CEA5FB
					-- vim.api.nvim_set_hl(0, "@lsp.type.parameter.typescriptreact", { fg = "#ecf2f8" })
					-- vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#FAA356" })
				end
			end,
		})
	end,
}
