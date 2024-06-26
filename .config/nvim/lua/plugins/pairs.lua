return {
    'windwp/nvim-ts-autotag',
    config = function ()
        require('nvim-ts-autotag').setup()
    end
    },
    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
    },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
        require('nvim-autopairs').setup({})
    end
}

