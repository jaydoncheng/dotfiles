return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					initial_mode = "normal",
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    }
				},
				pickers = {
					buffers = {
						initial_mode = "normal",
						sort_mru = true,
						mappings = {
							n = {
								["<leader>d"] = actions.delete_buffer,
							},
						},
					},
					find_files = {
                        initial_mode = "insert",
						find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!.local" },
						mappings = {
							i = {
								["<CR>"] = actions.select_default + actions.center,
							},
							n = {
								["<CR>"] = actions.select_default + actions.center,
							},
						},
					},
                    live_grep = {
                        initial_mode = "insert",
                        path_display = { "tail" },
                    }
				},
			})

			local utils = require("telescope.utils")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>p", function()
				builtin.find_files({ cwd = utils.buffer_dir() })
			end, { desc = "Find files in current buffer directory" })

			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep in current working directory" })

			vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "List buffers" })

			vim.keymap.set("n", "<leader>fb", function()
				builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } })
			end, { desc = "Live grep in buffer" })

			vim.keymap.set("n", "<leader>fB", function()
				builtin.live_grep({ grep_open_files = true })
			end, { desc = "Live grep in open buffers" })

			vim.keymap.set("n", "<leader>fd", function()
				builtin.find_files({ cwd = vim.fn.getcwd() })
			end, { desc = "Find files in current working directory" })

			vim.keymap.set("n", "<leader>l", function()
                builtin.lsp_document_symbols({
                    initial_mode = "insert",
                })
            end, {
				desc = "List treesitter symbols",
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						-- hijack_netrw = true,
					},
				},
			})
			require("telescope").load_extension("file_browser")
			vim.api.nvim_set_keymap(
			    "n",
			    "<leader>o",
			    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			    { noremap = true }
			)
		end,
	},
	-- config = function()
	-- 	vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope commands<CR>", { noremap = true })
	-- end,
}
