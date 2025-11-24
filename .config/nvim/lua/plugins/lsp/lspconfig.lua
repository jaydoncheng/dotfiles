return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("java").setup()
		require("lspconfig.ui.windows").default_options.border = "rounded"
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.diagnostic.config({
			update_in_insert = true,
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		-- vim.lsp.set_log_level("trace")

		local function on_attach()
			vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {})
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
			vim.keymap.set("n", "<leader>fe", "<cmd>Telescope diagnostics<CR>", {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "List code actions" })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.jdtls.setup({
			handlers = {
				["$/progress"] = function(_, result, ctx)
					-- disable progress updates.
				end,
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.clangd.setup({
			mason = false,
			cmd = {
				"/usr/bin/clangd-14",
				"--all-scopes-completion",
				"--completion-style=detailed",
				"--suggest-missing-includes",
				"--clang-tidy",
				"--background-index",
				"--log=info",
				"--pretty",
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.ols.setup({
			init_options = {
				checker_args = "-strict-style",
                enable_hover = true,
                enable_snippets = true,
                enable_semantic_tokens = true,
                enable_references = true,
                enable_renaming = true,
                enable_fake_methods = true,
                enable_inlay_hints = true,
			},
            capabilities = capabilities,
            on_attach = on_attach,
		})

		-- if only default config is needed:
		local lsps_default = {
			"lua_ls",
			"html",
			"tsserver",
			"cssls",
			"eslint",
			"svelte",
			"pyright",
			-- "clangd",
			-- "jdtls",
			"ruff_lsp",
			"tailwindcss",
		}
		for _, lsp in pairs(lsps_default) do
			lspconfig[lsp].setup({ capabilities = capabilities, on_attach = on_attach })
		end
	end,
}
