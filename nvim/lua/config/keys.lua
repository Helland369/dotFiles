-- leader key
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
