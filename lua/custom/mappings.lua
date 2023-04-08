---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<Leader>fm"] = { ":lua vim.lsp.buf.format({ timeout_ms = 6969 })<CR>", "format code" },
  },
}

-- more keybinds!

return M
