local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.cmd('let g:vimtex_view_method = "zathura"')
vim.cmd("let g:vimtex_format_enabled = 1")

vim.cmd("let s:clip = '/mnt/c/Windows/System32/clip.exe'")
