return {
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",  -- source text in buffer
            "hrsh7th/cmp-nvim-lsp", -- source for LSP
            "hrsh7th/cmp-path",    -- source for paths
            "L3MON4D3/LuaSnip",    -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- autocomplete snippets
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            -- require('luasnip.loaders.from_vscode').lazy_load()
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noinsert",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = false }),
                }),
                sources = cmp.config.sources({
                    -- { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "natdat" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "emoji" },
                    { name = "nvim_lua" },
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })
        end,
    },
}
