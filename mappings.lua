---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- Disable to allow the plugin nvim-tmux-navigator to bind (see custom/plugins.lua)
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<leader>gt"] = "", -- disable the default mapping for git status in telescope
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.telescope = {
  n = {
    ["<C-T>"] = { "<cmd> Telescope <CR>", "Open Telescope", opts = {} },
    ["<leader>gt"] = { "<cmd> Telescope telescope-tabs list_tabs <CR>", "Go to tab", opts = {} },
  },
}

-- LSP mappings
M.lsp = {
  n = {
    ["<F12>"] = { "<cmd> Telescope lsp_document_symbols <CR>", "LSP Show Symbols", opts = {} },
    ["<leader>lS"] = { "<cmd> Navbuddy <CR>", "Show symbol navigation (NavBuddy)", opts = {} },
  },
}

-- M.rust_lsp = {
--   n = {
--     ["ca"] = { "<cmd> RustLsp codeAction <CR>" },
--     ["K"] = { "<cmd> RustLsp hover actions <CR>" },
--   },
-- }
-- more keybinds!

return M
