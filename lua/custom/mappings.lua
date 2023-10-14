---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<Leader>fm"] = { ":lua vim.lsp.buf.format({ timeout_ms = 6969 })<CR>", "format code" },
    ["<leader>rn"] = { vim.lsp.buf.rename, "[R]e[n]ame" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "[C]ode [A]ction" },

    ["gd"] = { vim.lsp.buf.definition, "[G]oto [D]efinition" },
    ["gI"] = { vim.lsp.buf.implementation, "[G]oto [I]mplementation" },
    ["<leader>D"] = { vim.lsp.buf.type_definition, "Type [D]efinition" },
  },
}

-- more keybinds!

return M
