-- nvchad setup

require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)
require "plugins"

dofile(vim.g.base46_cache .. "defaults")


-- My stuff

-- nvim cmp
local cmp = require'cmp'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.abort(),
  })
})

-- nvim-cursorline
require('nvim-cursorline').setup {
  cursorword = {
    enable = true,
    hl = {underline = true},
  }
}

-- startify bookmarks
vim.g.startify_bookmarks = {
  "~/.config/nvim/init.lua",
  "~/Work/Personal/RunLog.txt",
}

-- copilot stuff
vim.g.copilot_assume_mapped = true

-- keybindings
local map = require("utils").map
-- terminal
map("n", "<F12>", ":lua require('nvterm.terminal').toggle 'horizontal' <CR>")
-- telescope
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files() <CR>")
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep() <CR>")
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers() <CR>")
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags() <CR>")
-- scroll up/down
map("n", "<C-J>", "<C-E>")
map("n", "<C-K>", "<C-Y>")
-- better esc
map("t", "<Esc>", "<C-\\><C-n>")
-- resize windows
map("n", "<M-S-J>", "<C-W>-")
map("n", "<M-S-K>", "<C-W>+")
map("n", "<M-S-H>", "<C-W><")
map("n", "<M-S-L>", "<C-W>>")

-- set tab to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
