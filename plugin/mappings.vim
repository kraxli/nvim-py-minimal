
if !exists("g:nvimipdb_default_keys")
    let g:nvimipdb_default_keys = 1
endif


nnoremap <silent> <Plug>GoToDebugLine nvimipdb#GoToDebugLine<cr>
nnoremap <silent> <unique> <Plug>OpenDebugFile nvimipdb#OpenDebugFile

nnoremap <silent> <Plug>ReplSendPyLine ReplSendPyLine
nnoremap <silent> <Plug>ReplSendPyFile ReplSendPyFile
vnoremap <silent> <Plug>ReplSendPySelection ReplSendPySelection
vnoremap <silent> <Plug>ReplSendPy2IPy ReplSendPy2IPy
nnoremap <silent> <Plug>IPython2 IPython2
nnoremap <silent> <Plug>IPython3 IPython3
noremap <silent> <Plug>Ipdb Ipdb


" DEFAULT KEY MAPPINGS:
if g:nvimipdb_default_keys
   augroup nvimipdbGroup
       au!
       " nmap gt <Plug>OpenLeftDebugFile
       " nmap gt :OpenLeftDebugFile<cr>
       " au TermOpen * nmap <buffer> gt :OpenLeftDebugFile<cr>
       au TermOpen * nmap <buffer> gt <Plug>GoToDebugLine

      au FileType python nmap <silent> <f9> <Plug>ReplSendPyLine
      au FileType python vmap <silent> <f9> <Plug>ReplSendPySelection
      au FileType python nmap <silent> f<f9> <Plug>ReplSendPyFile ReplSendPyFile
      au FileType python map <F5> <Plug>Ipdb

      autocmd Filetype python nnoremap <silent> <m-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
      autocmd Filetype python vnoremap <silent> <m-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
      autocmd Filetype python nnoremap <silent> f<f5> :%y+<cr> :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
   augroup END
endif

