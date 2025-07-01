require("config.vim")
require("config.lazy")
require("config.telescopecf")
require("config.treesitter")
require("config.neotree")

-- Enable clipboard with wl-clipboard
vim.opt.clipboard = 'unnamedplus'

-- Add key mappings for copy and paste
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })

