return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "tpope/vim-fugitive" },
    event = "VeryLazy",
    opts = function()
      -- Gruvbox Material

      local colors = {
        bg = "#191B1C",    -- base
        bg2 = "#292929",   -- surface0
        fg = "#ebdbb2",    -- text
        red = "#ea6962",   -- red
        green = "#a9b665", -- green
        blue = "#7daea3",  -- blue
        lightblue = "#89b482", -- sky
        yellow = "#d8a657", -- yellow
        pink = "#d3869b",  -- pink
        violet = "#d3869b", -- mauve
        cyan = "#89b482",  -- teal (closest to cyan)
        magenta = "#d3869b", -- pink (used as magenta)
        white = "#ebdbb2", -- text
        orange = "#e78a4e", -- peach
        darkblue = "#666666", -- surface1
      }

      -- VS Code

      -- local colors = {
      -- 	-- bg = "#262626",
      -- 	bg = "#181818",
      -- 	bg2 = "#373737",
      -- 	fg = "#bbbbbb",
      -- 	red = "#f44747",
      -- 	green = "#4EC9B0",
      -- 	blue = "#0a7aca",
      -- 	lightblue = "#5CB6F8",
      -- 	yellow = "#DCDCAA",
      -- 	pink = "#DDB6F2",
      -- 	violet = "#DDB6F2", -- Matching pink as violet isn't explicitly defined
      -- 	cyan = "#5CB6F8", -- Closest match to light blue
      -- 	magenta = "#DDB6F2", -- Matching pink
      -- 	white = "#ffffff", -- Same as fg
      -- 	orange = "#ffaf00", -- Same as yellow
      -- 	darkblue = "#666666", -- bg2 for a darker contrast
      -- }

      -- TokyoNight

      -- local colors = {
      -- 	bg = "#16161E",
      -- 	-- bg = "#1A1B26",
      -- 	-- bg = "#05070D",
      -- 	fg = "#a9b1d6",
      -- 	yellow = "#e0af68",
      -- 	cyan = "#7dcfff",
      -- 	-- darkblue = "#414868",
      -- 	darkblue = "#5a636e",
      -- 	green = "#73daca",
      -- 	orange = "#e0af68",
      -- 	violet = "#bb9af7",
      -- 	magenta = "#bb9af7",
      -- 	blue = "#7aa2f7",
      -- 	red = "#f7768e",
      -- 	white = "#c0caf5",
      -- }

      -- GitHub Dark

      -- local colors = {
      -- 	bg = "#14171C",
      -- 	fg = "#9EAFC2",
      -- 	-- bg = "#0D0F13",
      -- 	-- fg = "#8b949e",
      -- 	yellow = "#e3b341",
      -- 	cyan = "#2b7489",
      -- 	darkblue = "#5a636e",
      -- 	green = "#56d364",
      -- 	orange = "#f78166",
      -- 	violet = "#db61a2",
      -- 	magenta = "#db61a2",
      -- 	blue = "#6ca4f8",
      -- 	red = "#f78166",
      -- 	white = "#ffffff",
      -- }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local config = {
        options = {
          icons_enabled = false,
          component_separators = "",
          section_separators = "",
          theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- local function ins_center(component)
      --   -- Insert the `%=` separator if it's not already there
      --   local c_section = config.sections.lualine_c
      --   local last_item = c_section[#c_section]
      --   if not last_item or last_item[1] ~= "%=" then
      --     table.insert(c_section, { "%=" })
      --   end
      --
      --   -- Add the component after `%=`
      --   table.insert(c_section, component)
      -- end

      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      -- ins_left({
      -- 	"mode",
      -- 	color = { fg = colors.foreground, bg = colors.background },
      -- 	padding = { left = 1, right = 0 },
      -- })

      ins_left({
        function()
          local name = vim.api.nvim_buf_get_name(0)

          if not name or name == "" then
            return "[No Name]"
          end

          -- Get the Lualine config to check if icons are enabled
          local icons_enabled = require("lualine").get_config().options.icons_enabled

          -- Get the file name and extension
          local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")

          -- Get the full path and modify it as desired
          local full_path = vim.api.nvim_buf_get_name(0)
          if not full_path or full_path == "" then
            return "[No Name]"
          end

          -- Use fnamemodify for path modification (replace ":." with any modifier you prefer)
          local shortened_path = vim.fn.fnamemodify(full_path, ":.")
          local icon = require("nvim-web-devicons").get_icon(file_name, file_ext, { default = true })

          -- Return the formatted path with or without the icon based on the config
          if icons_enabled then
            return (icon or "") .. " " .. shortened_path
          else
            return shortened_path
          end
        end,
        color = { fg = colors.fg },
        padding = { left = 1, right = 1 },
      })

      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        icons_enabled = false,
        -- symbols = { error = " ", warn = " ", info = " " },
        symbols = { error = "E:", warn = "W:", info = "H:" },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
        },
      })

      ins_left({
        function()
          local branch = vim.fn.FugitiveHead()
          if not branch or branch == "" then
            return "No Branch"
          end

          local icons_enabled = require("lualine").get_config().options.icons_enabled
          if icons_enabled then
            return " " .. branch
          else
            return branch
          end
        end,
        color = { fg = colors.darkblue },
        padding = { left = 1, right = 1 },
      })

      ins_right({
        "location",
        color = { fg = colors.fg },
      })

      ins_right({ "progress", color = { fg = colors.fg } })

      -- ins_left({
      -- 	function()
      -- 		return " " .. string.upper(vim.fn.mode())
      -- 	end,
      -- 	color = { fg = colors.blue, bg = colors.bg, gui = "bold" },
      -- 	padding = { left = 1, right = 1 },
      -- })

      -- ins_left({
      -- 	function()
      -- 		return " "
      -- 	end,
      -- 	color = { fg = colors.bg, bg = colors.blue, gui = "bold" },
      -- 	padding = { left = 1, right = 0 },
      -- })

      -- ins_left({
      -- 	function()
      -- 		-- return "▊"
      -- 		return ""
      -- 	end,
      -- 	color = { fg = colors.blue },
      -- 	padding = { left = 0, right = 0 },
      -- })

      -- ins_left({
      --   "filetype",
      --   icons_enabled = true,
      --   icon_only = true,
      --   color = { fg = colors.white },
      -- })

      -- ins_left({ "filename", color = { fg = colors.white } })

      -- ins_left({
      --   function()
      --     return "%="
      --   end,
      -- })

      -- ins_right({
      --   "o:encoding",
      --   fmt = string.upper,
      --   cond = conditions.hide_in_width,
      --   color = { fg = colors.green, gui = "bold" },
      -- })

      -- ins_right({
      -- 	"diff",
      -- 	symbols = { added = " ", modified = "󰝤 ", removed = " " },
      -- 	diff_color = {
      -- 		added = { fg = colors.green },
      -- 		modified = { fg = colors.orange },
      -- 		removed = { fg = colors.red },
      -- 	},
      -- 	cond = conditions.hide_in_width,
      -- })

      -- ins_right({
      -- 	"branch",
      -- 	icon = "",
      -- 	color = { fg = colors.darkblue, gui = "bold" },
      -- 	padding = { left = 0, right = 1 },
      -- 	cond = conditions.hide_in_width,
      -- })

      -- ins_right({
      -- 	function()
      -- 		return "▊"
      -- 		-- return ""
      -- 	end,
      -- 	color = { fg = colors.blue },
      -- 	padding = { left = 0 },
      -- })

      return config
    end,
  },
}
