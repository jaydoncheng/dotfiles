return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("bamboo").setup({
			transparent = true,
            -- colors = {
            --     comment = "#f0e8c5",
            -- },
            -- highlights = {
            --     ['@comment'] = { fg = '$comment' }
            -- }
		})
		require("bamboo").load()
	end,
}
