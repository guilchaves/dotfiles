return {
	{ "github/copilot.vim" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		config = function()
			require("CopilotChat").setup({
				mappings = {
					close = {
						normal = "<leader>zq",
						insert = "<C-c>",
					},
					reset = {
						normal = "<leader>zr",
						inser = "<C-r>",
					},
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"github/copilot.vim",
		},
		build = "make tiktoken",
		opts = {},
		keys = {
			{ "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Open Copilot Chat" },
			{ "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
			{ "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review code" },
			{ "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix code issues" },
			{ "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize code" },
			{ "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate docs" },
			{ "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate tests" },
			{ "<leader>zm", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate commit message" },
			{ "<leader>zs", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate commit for selection" },
		},
	},
}
