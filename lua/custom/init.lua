local autocmd = vim.api.nvim_create_autocmd

 -- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.cmd('let g:vimtex_view_method = "zathura_simple"')
vim.cmd('let g:vimtex_format_enabled = 1')
