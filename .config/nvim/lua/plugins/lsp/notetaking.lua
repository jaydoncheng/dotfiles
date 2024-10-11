return {
    {
        "Gelio/cmp-natdat",
        config = function()
            require("cmp_natdat").setup({})
        end
    },
    {
        "allaman/emoji.nvim",
        version = "1.0.0", -- optionally pin to a tag
        ft = "markdown", -- adjust to your needs
        dependencies = {
            -- optional for nvim-cmp integration
            "hrsh7th/nvim-cmp",
            -- optional for telescope integration
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            -- default is false
            enable_cmp_integration = true,
        },
        config = function(_, opts)
            require("emoji").setup(opts)
            -- optional for telescope integration
            local ts = require("telescope").load_extension("emoji")
            vim.keymap.set("n", "<leader>fe", ts.emoji, { desc = "[S]earch [E]moji" })
        end,
    },
}
