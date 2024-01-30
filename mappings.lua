---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- Disable to allow the plugin nvim-tmux-navigator to bind (see custom/plugins.lua)
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
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
  },
}

-- LSP mappings
M.lsp = {
  n = {
    ["<F12>"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Show LSP Symbols", opts = {} },
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
