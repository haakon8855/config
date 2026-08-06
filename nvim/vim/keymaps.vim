" Keymaps
"
" Append ';' at EOL
nnoremap K m`A;<Esc>``
" Don't yank on paste
xnoremap p "_dP
" Map æ to end of line
nnoremap æ $
" Wrap selection in `backticks` (inline code block)
vmap <leader>c S`
" Wrap selection in ```backticks``` (multiline code block)
vmap <leader>C s<CR><CR><Esc>k"_cc``````<Esc>hhi<CR><Esc>p

