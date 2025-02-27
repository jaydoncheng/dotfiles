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
						-- find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!.local" },
						-- find_command = { "rg", "--files" },
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
                        additional_args = { "--hidden"},
                        path_display = { "tail" },
                    }
				},
			})
			local utils = require("telescope.utils")
			local builtin = require("telescope.builtin")

            local custom_find_files
            custom_find_files = function(opts, no_ignore)
                opts = opts or {}
                no_ignore = vim.F.if_nil(no_ignore, false)
                opts.attach_mappings = function(_, map)
                    map({"n","i"},
                        "<C-h>", function(prompt_bufnr)
                            local prompt = require("telescope.actions.state").get_current_line()
                            require("telescope.actions").close(prompt_bufnr)
                            no_ignore = not no_ignore
                            custom_find_files({default_text = prompt}, no_ignore)
                        end)
                    return true
                end

                if no_ignore then
                    opts.no_ignore = true
                    opts.hidden = true
                    opts.prompt_title = "Find Files <all>"
                    opts.find_command = { "rg", "--files", "--hidden", "--no-ignore", "-g", "!.git", "-g", "!.local" }
                    builtin.find_files(opts)
                else
                    opts.prompt_title = "Find Files"
                    opts.find_command = { "rg", "--files", "--ignore"}
                    builtin.find_files(opts)
                end
            end

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
				custom_find_files({ cwd = vim.fn.getcwd() })
			end, { desc = "Find files in current working directory" })
			vim.keymap.set("n", "<leader>l", function()
                builtin.lsp_document_symbols({initial_mode = "insert"})
            end, { desc = "List treesitter symbols" })
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
            local fb_actions = require("telescope").extensions.file_browser.actions
			require("telescope").setup({
				extensions = {
					file_browser = {
                        mappings = {
                            ["i"] = {
                                ["<C-h>"] = function (prompt_bufnr)
                                    fb_actions.toggle_hidden(prompt_bufnr)
                                    fb_actions.toggle_respect_gitignore(prompt_bufnr)
                                end,
                            },
                            ["n"] = {
                                ["<C-h>"] = function (prompt_bufnr)
                                    fb_actions.toggle_hidden(prompt_bufnr)
                                    fb_actions.toggle_respect_gitignore(prompt_bufnr)
                                end,
                            }
                        }
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
}
