return {
	-- 其他插件配置
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local status_ok, lualine = pcall(require, "lualine")
			if not status_ok then
				vim.notify("lualine not found!")
				return
			end

			local hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = " ", warn = " " },
				colored = false,
				update_in_insert = false,
				always_visible = true,
			}

			local diff = {
				"diff",
				colored = true,
				symbols = { added = "  ", modified = " ", removed = " " },
				diff_color = {
					added = { fg = "#98be65" },
					modified = { fg = "#ecbe7b" },
					removed = { fg = "#ec5f67" },
				},
				cond = hide_in_width
			}

			local mode = {
				"mode",
				fmt = function(str)
					return "-- " .. str .. " --"
				end,
			}

			local file_name = {
				'filename',
				file_status = true,
				path = 1,
				shorting_target = 40,
				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '[No Name]',
				},
			}

			local filetype = {
				"filetype",
				icons_enabled = false,
				icon = nil,
			}

			local branch = {
				"branch",
				icons_enabled = true,
				icon = "",
			}

			local location = {
				"location",
				padding = 0,
			}

			local progress = function()
				local current_line = vim.fn.line(".")
				local total_lines = vim.fn.line("$")
				local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", " ", }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end

			local spaces = function()
				return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
			end

			lualine.setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { branch, diagnostics },
					lualine_b = { mode },
					lualine_c = { file_name },
					lualine_x = { diff, spaces, "encoding", filetype, "fileformat" },
					lualine_y = { location },
					lualine_z = { progress },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { file_name },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})
		end,
	},
	-- 其他插件配置
}
