vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- config <leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remap Caps Lock to Escape in Insert Mode
vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', { noremap = true, silent = true })


-- Move Left/Right by character
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })  -- Ctrl+h to move left
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true }) -- Ctrl+l to move right

-- Move Up/Down by line
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true }) -- Ctrl+j to move down
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })   -- Ctrl+k to move up

-- Move to beginning/end of line
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>I', { noremap = true, silent = true }) -- Ctrl+a to move to beginning of line
vim.api.nvim_set_keymap('i', '<C-e>', '<Esc>A', { noremap = true, silent = true }) -- Ctrl+e to move to end of line

-- Config lsp keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

vim.keymap.set('n', '<leader>t', ':terminal<CR>', {})
vim.keymap.set('n', '<leader>w', ':w<CR>', {})

-- Config fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.clipboard = "unnamedplus"

vim.opt.foldlevel = 99
vim.opt.foldenable = true

vim.keymap.set('n', '<leader>1',':set foldlevel=1<CR>', {})
vim.keymap.set('n', '<leader>2',':set foldlevel=2<CR>', {})
vim.keymap.set('n', '<leader>3',':set foldlevel=3<CR>', {})
vim.keymap.set('n', '<leader>4',':set foldlevel=4<CR>', {})
vim.keymap.set('n', '<leader>5',':set foldlevel=5<CR>', {})










