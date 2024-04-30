return
{
    'nvim-treesitter/nvim-treesitter',
    build = ':tsupdate',
    opts = {
        ensure_installed = {
            'css', 'scss', 'less',
            'html', 'javascript', 'typescript', 'tsx', 'json', 'yaml', 'toml',
            'python', 'rust', 'go', 'c', 'cpp', 'java', 'php', 'ruby', 'bash', 'lua',
            'svelte'
        }
    },
    config = function()
        local ts_config = require('nvim-treesitter.configs')
        ts_config.setup({
            ensure_installed = { 'lua', 'javascript' },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
