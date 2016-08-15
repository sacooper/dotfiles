nnoremap <leader>t :GhcModType<cr>

autocmd BufWritePost *.hs GhcModCheckAndLintAsync

nnoremap <leader><space> :GhcModTypeClear<CR>:nohlsearch<CR>
