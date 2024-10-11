return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                separator_style = "thin",
            },
            highlights = {
                fill = {
                    bg = '#2f312c',
                },
                background = {
                    bg = '#2f312c',
                },
                tab = {
                    bg = '#2f312c',
                },
                tab_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                },
                tab_separator = {
                    bg = '#2f312c',
                },
                tab_separator_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                },
                tab_close = {
                    bg = '#2f312c',
                },
                close_button = {
                    bg = '#2f312c',
                },
                close_button_visible = {
                    bg = '#2f312c',
                },
                close_button_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                },
                buffer_visible = {
                    bg = '#2f312c',
                },
                buffer_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                numbers = {
                    bg = '#2f312c',
                },
                numbers_visible = {
                    bg = '#2f312c',
                },
                numbers_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                diagnostic = {
                    bg = '#2f312c',
                },
                diagnostic_visible = {
                    bg = '#2f312c',
                },
                diagnostic_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                hint = {
                    bg = '#2f312c',
                },
                hint_visible = {
                    bg = '#2f312c',
                },
                hint_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                hint_diagnostic = {
                    bg = '#2f312c',
                },
                hint_diagnostic_visible = {
                    bg = '#2f312c',
                },
                hint_diagnostic_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                info = {
                    bg = '#2f312c',
                },
                info_visible = {
                    bg = '#2f312c',
                },
                info_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                info_diagnostic = {
                    bg = '#2f312c',
                },
                info_diagnostic_visible = {
                    bg = '#2f312c',
                },
                info_diagnostic_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                warning = {
                    bg = '#2f312c',
                },
                warning_visible = {
                    bg = '#2f312c',
                },
                warning_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                warning_diagnostic = {
                    bg = '#2f312c',
                },
                warning_diagnostic_visible = {
                    bg = '#2f312c',
                },
                warning_diagnostic_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                error = {
                    bg = '#2f312c',
                },
                error_visible = {
                    bg = '#2f312c',
                },
                error_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                error_diagnostic = {
                    bg = '#2f312c',
                },
                error_diagnostic_visible = {
                    bg = '#2f312c',
                },
                error_diagnostic_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                modified = {
                    bg = '#2f312c',
                },
                modified_visible = {
                    bg = '#2f312c',
                },
                modified_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                },
                duplicate_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    italic = true,
                },
                duplicate_visible = {
                    bg = '#2f312c',
                    italic = true,
                },
                duplicate = {
                    bg = '#2f312c',
                    italic = true,
                },
                separator_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                },
                separator_visible = {
                    bg = '#2f312c',
                },
                separator = {
                    bg = '#2f312c',
                },
                indicator_visible = {
                    bg = '#2f312c',
                },
                indicator_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                },
                pick_selected = {
                    bg = '#8fb573',
                    fg = '#f1e9d2',
                    bold = true,
                    italic = true,
                },
                pick_visible = {
                    bg = '#2f312c',
                    bold = true,
                    italic = true,
                },
                pick = {
                    bg = '#2f312c',
                    bold = true,
                    italic = true,
                },
                offset_separator = {
                    bg = '#2f312c',
                },
                trunc_marker = {
                    bg = '#2f312c',
                }

            }
        })
    end,
}
