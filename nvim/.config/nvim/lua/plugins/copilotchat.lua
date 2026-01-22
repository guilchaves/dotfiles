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
				{
					window = {
						layout = "float",
						width = 80, -- Fixed width in columns
						height = 20, -- Fixed height in rows
						border = "rounded", -- 'single', 'double', 'rounded', 'solid'
						title = "🤖 AI Assistant",
						zindex = 100, -- Ensure window stays on top
					},
					headers = {
						user = "👤 You",
						assistant = "🤖 Copilot",
						tool = "🔧 Tool",
					},

					separator = "━━",
					auto_fold = true, -- Automatically folds non-assistant messages
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
