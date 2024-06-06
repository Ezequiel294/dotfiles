return {
	{ "github/copilot.vim" },

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
		config = function()
			require("CopilotChat").setup({
				window = {
					layout = "float",
                    width = 0.7,
                    height = 0.7,
				},
			})

			vim.keymap.set("n", "<leader>ct", ":CopilotChatToggle<CR>")
			vim.keymap.set("v", "<leader>ce", ":CopilotChatExplain<CR>")
			vim.keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>")
			vim.keymap.set("v", "<leader>cf", ":CopilotChatFix<CR>")
			vim.keymap.set("v", "<leader>co", ":CopilotChatOptimize<CR>")
		end,
	},
}
