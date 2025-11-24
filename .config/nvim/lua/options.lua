vim.cmd("set number")
vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set linebreak")
vim.g.mapleader = " "

vim.cmd("set conceallevel=2")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- vim.keymap.set('n', '<leader>o', ':Explore<CR>')

vim.keymap.set('n', '}', '<Cmd>call search("[{]")<CR>')
vim.keymap.set('n', '{', '<Cmd>call search("[}]", "b")<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>bd<CR>')
vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<M-h>', '<Cmd>vertical resize -1<CR>')
vim.keymap.set('n', '<M-j>', '<Cmd>resize -1<CR>')
vim.keymap.set('n', '<M-k>', '<Cmd>resize +1<CR>')
vim.keymap.set('n', '<M-l>', '<Cmd>vertical resize +1<CR>')

vim.keymap.set('n', 'j', 'gj');
vim.keymap.set('v', 'j', 'gj');
vim.keymap.set('n', 'k', 'gk');
vim.keymap.set('v', 'k', 'gk');

vim.keymap.set('n', 'cn', '<cmd>cnext<CR>')
vim.keymap.set('n', 'cp', '<cmd>cprev<CR>')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
