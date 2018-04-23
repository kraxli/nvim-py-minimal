echo "file sourced"

if !exists('g:nvimipdb_default_keys')
    let g:nvimipdb_default_keys = 0
endif

if g:nvimipdb_default_keys
augroup nvimipdbGroup
    au!

    " map <silent> <leader>bp Oimport ipdb; ipdb.set_trace()<esc>
    " map <silent> <leader>Bp oimport ipdb; ipdb.set_trace()<esc>
    au FileType python map  <leader>bp <Plug>SetBreakPoint
    au FileType python map  <leader>Bp <Plug>SetBreakPointBelow

    nnoremap <leader>bd :call nvimipdb#DelBreakPoints()<cr> " <Plug>DelBreakPoints
    " nmap gt <Plug>OpenLeftDebugFile
    " nmap gt :OpenLeftDebugFile<cr>
    " au TermOpen * nmap <buffer> gt :OpenLeftDebugFile<cr>
    "
    au TermOpen * nmap <buffer> gt <Plug>GoToDebugLine
    " au TermOpen * nmap <buffer> gt :call nvimipdb#GoToDebugLine()<cr> 

    au FileType python map <F5> <Plug>Ipdb

    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3
      \ :vsp term\://ipython3 | let g:last_ipy_terminal_job_id = b:terminal_job_id


    autocmd Filetype python nnoremap <silent> <c-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id) \| let g:ipy_parent_buffer=expand('%:p')<cr>
    autocmd Filetype python vnoremap <silent> <c-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id) \| let g:ipy_parent_buffer=expand('%:p')<cr>
    autocmd Filetype python nnoremap <silent> <c-s><c-s> :%y+<cr> :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id) \| let g:ipy_parent_buffer=expand('%:p')<cr>
    " autocmd Filetype python nmap <silent> <c-s> <Plug>PySendLine2Repl
    " autocmd Filetype python vmap <silent> <c-s> <Plug>PySendSelection2Repl
    " autocmd Filetype python nmap <silent> <c-s><c-s> <Plug>PySendFile2Repl
augroup END
endif

