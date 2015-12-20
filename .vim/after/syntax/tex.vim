set spell
set wrap
set linebreak
set nolist  " list disables linebreak
syntax sync fromstart

inoremap -> $\to$
inoremap => $\Rightarrow$
inoremap ... \ldots

autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer = 'evince' 
nmap <leader>p :LLPStartPreview<cr>

nnoremap <leader>bw i\textbf{<esc>ea}<esc>
nnoremap <leader>iw i\emph{<esc>ea}<esc>
nnoremap <leader>uw i\underline{<esc>ea}<esc>

inoremap ** \textbf{}<esc>i
