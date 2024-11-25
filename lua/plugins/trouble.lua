return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "开放式故障工作区诊断" },
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "打开故障文件诊断",
		},
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "打开故障快速修复列表" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "开路故障定位表" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "打开待办事项" },
	},
}
