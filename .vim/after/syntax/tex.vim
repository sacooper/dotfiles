set spell
"set wrap
"set linebreak
"set nolist  " list disables linebreak
syntax sync fromstart

autocmd Filetype tex setl updatetime=1000
nmap <leader>p :LLPStartPreview<cr>
let g:tex_flavor='latex'

"nnoremap <leader>bw i\textbf{<esc>ea}<esc>
"nnoremap <leader>iw i\emph{<esc>ea}<esc>
"nnoremap <leader>uw i\underline{<esc>ea}<esc>

"inoremap ** \textbf{}<esc>i
