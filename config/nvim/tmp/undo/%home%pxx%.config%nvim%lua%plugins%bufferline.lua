Vim�UnDo� jd��/V�Ӳ@��"?-��/�fS"`�+�G                                      f�ѫ    _�                            ����                                                                                                                                                                                                                                                                                                                	                                           f�ѓ    �                 return {   	"akinsho/bufferline.nvim",   	event = "VeryLazy",   		opts = {   		options = {   			mode = "buffer",   			number = "ordinal",   V			offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},   		},   		highlights = {   6			buffer_selected = { italic = false, bold = false },   		},   	},   	config = function(_, opts)   #		require("bufferline").setup(opts)   ,		-- Fix bufferline when restoring a session   )		vim.api.nvim_create_autocmd("BufAdd", {   			callback = function()   				vim.schedule(function()   					pcall(nvim_bufferline)   				end)   			end,   		})   	end,   }5�5�_�                            ����                                                                                                                                                                                                                                                                                                                	                                           f�Ѫ    �                 return {   	"akinsho/bufferline.nvim",   	event = "VeryLazy",   		opts = {   		options = {   			mode = "buffer",   			number = "ordinal",   V			offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},   		},   		highlights = {   6			buffer_selected = { italic = false, bold = false },   		},   	},   	config = function(_, opts)   #		require("bufferline").setup(opts)   ,		-- Fix bufferline when restoring a session   )		vim.api.nvim_create_autocmd("BufAdd", {   			callback = function()   				vim.schedule(function()   					pcall(nvim_bufferline)   				end)   			end,   		})   	end,   }5�5��