
nmap <silent> <Plug>(py-send-line-to-repl) PySendLine<cr>
vmap <silent> <Plug>(py-send-selection-to-repl) PySendSelection<cr>
nmap <silent> <Plug>(py-send-file-to-repl) PySendFile<cr>
" vnoremap <silent> <Plug>ReplSendPy2IPy ReplSendPy2IPy<cr>


nnoremap <silent> <Plug>GoToDebugLine :call nvimipdb#GoToDebugLine()<cr>
nnoremap <silent> <Plug>OpenPyDebugFile :call nvimipdb#OpenDebugFile()<cr>
" nnoremap <silent> <unique> <Plug>OpenPyDebugFile :call nvimipdb#OpenDebugFile()<cr>

nnoremap <silent> <Plug>IPython2 IPython2<cr>
nnoremap <silent> <Plug>IPython3 IPython3<cr>
noremap <silent> <Plug>Ipdb :execute("Ipdb")<cr>

noremap <silent> <Plug>SetBreakPoint Oimport ipdb; ipdb.set_trace()<esc>
noremap <silent> <Plug>SetBreakPointBelow oimport ipdb; ipdb.set_trace()<esc>

nnoremap <silent> <Plug>DelBreakPoints nvimipdb#DelBreakPoints()



