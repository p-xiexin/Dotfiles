local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"
  
	local function opts(desc)
	  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
  
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
  
	-- custom mappings
	vim.keymap.set('n', 'O', api.tree.change_root_to_node, opts('CD'))
end
  
return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				on_attach = my_on_attach,
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
		end
	}
}