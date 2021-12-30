echo "C config loaded"
set makeprg=gcc\ %\ -o\ %<\ -lm
nnoremap <F11> :w<cr>:make<cr>
nnoremap <F12> :te./%<<cr>
