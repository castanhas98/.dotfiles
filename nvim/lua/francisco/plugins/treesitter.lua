return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
                    "vimdoc", "java", "c", "cpp", "python", "lua", "bash"
                },
				sync_install = false,
				highlight = { enable = true },
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI
				-- installed locally
				auto_install = false,
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}
