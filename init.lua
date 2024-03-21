-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- set to show relative line numbers and the line numbers
-- by default
-- This is the same as calling :set number relativenumber
vim.opt.relativenumber = true
vim.opt.number = true

