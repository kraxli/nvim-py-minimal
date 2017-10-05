
if !exists("g:nvimipdb_default_keys")
    let g:nvimipdb_default_keys = 1
endif


nnoremap <silent> <Plug>GoToDebugLine nvimipdb#GoToDebugLine<cr>
nnoremap <silent> <unique> <Plug>OpenDebugFile nvimipdb#OpenDebugFile

" nnoremap <silent> <Plug>ReplSendPyLine ReplSendPyLine
" nnoremap <silent> <Plug>ReplSendPyFile ReplSendPyFile
vnoremap <silent> <Plug>ReplSendPySelection ReplSendPySelection
vnoremap <silent> <Plug>ReplSendPy2IPy ReplSendPy2IPy
nnoremap <silent> <Plug>IPython2 IPython2
nnoremap <silent> <Plug>IPython3 IPython3
noremap <silent> <Plug>Ipdb Ipdb

noremap <silent> <Plug>SetBreakPoint Oimport ipdb; ipdb.set_trace()<esc>
noremap <silent> <Plug>SetBreakPointBelow oimport ipdb; ipdb.set_trace()<esc>

nnoremap <leader>bd :call nvimipdb#DelBreakPoints()


" DEFAULT KEY MAPPINGS:
if g:nvimipdb_default_keys
   augroup nvimipdbGroup
       au!

      " map <silent> <leader>bp Oimport ipdb; ipdb.set_trace()<esc>
      " map <silent> <leader>Bp oimport ipdb; ipdb.set_trace()<esc>
      au FileType python map  <leader>bp <Plug>SetBreakPoint
      au FileType python map  <leader>Bp <Plug>SetBreakPointBelow

      " nmap gt <Plug>OpenLeftDebugFile
      " nmap gt :OpenLeftDebugFile<cr>
      " au TermOpen * nmap <buffer> gt :OpenLeftDebugFile<cr>
      au TermOpen * nmap <buffer> gt <Plug>GoToDebugLine

      au FileType python map <F5> <Plug>Ipdb

      autocmd Filetype python nnoremap <silent> <c-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
      autocmd Filetype python vnoremap <silent> <c-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
      autocmd Filetype python nnoremap <silent> <c-s><c-s> :%y+<cr> :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
      " autocmd Filetype python nmap <silent> <c-s> <Plug>PySendLine2Repl
      " autocmd Filetype python vmap <silent> <c-s> <Plug>PySendSelection2Repl
      " autocmd Filetype python nmap <silent> <c-s><c-s> <Plug>PySendFile2Repl
   augroup END
endif

" " TODO with <Plug>
" " MAPS:
" nnoremap <silent> <m-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
" vnoremap <silent> <m-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
" nnoremap <silent> f<f5> :%y+<cr> :call nvimipdb#send2repl(["\%paste"])<cr>


