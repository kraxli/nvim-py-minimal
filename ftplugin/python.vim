

" COMMANDS:
command! ReplSendPyLine call nvimipdb#send2repl([getline('.')])
command! -range=% ReplSendPyFile silent call nvimipdb#send2repl(getline(<line1>,<line2>))
command! -range ReplSendPySelection silent call nvimipdb#send2repl(getline(<line1>,<line2>))
" send visual selection to ipython terminal:
command! -range ReplSendPy2IPy silent call nvimipdb#send2repl(["\%paste"])

augroup nvimipdbGroup
    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython2 
      \ :vsp term://ipython | let g:last_ipy_terminal_job_id = b:terminal_job_id
    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3 
      \ :vsp term://ipython3 | let g:last_ipy_terminal_job_id = b:terminal_job_id
augroup END


" command! Ipdb :vsp term://python3 expand("%:p")
command! Ipdb
    \ :let current_file = expand("%:p")
    \ | vsp +term
    \ | silent call nvimipdb#send2repl(["python3 ".current_file])
    \ | let g:last_ipy_terminal_job_id = b:terminal_job_id
    " \ | let g:last_ipdb_terminal_job_id = b:terminal_job_id

command! Debug :Ipdb


" " TODO with <Plug>
" " MAPS:
" nnoremap <silent> <m-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
" vnoremap <silent> <m-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
" nnoremap <silent> f<f5> :%y+<cr> :call nvimipdb#send2repl(["\%paste"])<cr>



