local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.cmd('let g:vimtex_view_method = "zathura"')
vim.cmd("let g:vimtex_format_enabled = 1")

-- WSL clipboard hack
vim.cmd([[let g:clipboard = {"name": "WslClipboard","copy": {"+": "clip.exe","*": "clip.exe",},"paste": {"+": "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))","*": "powershell.exe -c [Console::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",},'cache_enabled': 0,}]])
