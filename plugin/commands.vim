
" if !exists("g:nvimipdb_default_keys")
    " let g:nvimipdb_default_keys = 1
" endif


nmap <silent> <Plug>GoToDebugLine nvimipdb#GoToDebugLine
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

nnoremap <silent> <Plug>DelBreakPoints nvimipdb#DelBreakPoints()


" " TODO with <Plug>
" " MAPS:
" nnoremap <silent> <m-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
" vnoremap <silent> <m-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
" nnoremap <silent> f<f5> :%y+<cr> :call nvimipdb#send2repl(["\%paste"])<cr>


