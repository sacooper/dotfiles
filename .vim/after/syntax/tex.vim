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
