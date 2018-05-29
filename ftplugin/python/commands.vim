


" COMMANDS:
command! PySendLine silent call minpy#send2repl([getline('.')])

" command! -range ReplSendPySelection silent call minpy#send2repl(getline(<line1>,<line2>))
command! -range PySendSelection silent call minpy#py_selection_to_repl()

" command! -range=% ReplSendPyFile silent call minpy#send2repl(getline(<line1>,<line2>))<cr>
command! PySendFile silent call minpy#py_send_file_to_repl()

" send visual selection to ipython terminal:
" command! -range ReplSendPy2IPy silent call minpy#send2repl(["\%paste"])<cr>

command!  -range=%  Yapf <line1>,<line2>call yapf#yapf(g:py_style_pep8)<cr>
" map <C-Y> :call yapf#YAPF()<cr>
" imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" autocmd! BufNewFile,BufRead *.py,*.python :command! -nargs=1 InclBp  :call InclBreakPoint(<f-args>)<cr>
command! ClearBps :call minpy#ClearBpsFct()<cr>

" the follwoing errorformat works for AsyncRun python %:p
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]
command! PyRun AsyncRun python3 %:p
" setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython2
  \ :let g:parent_win =  winnr() |
  \ vsp term\://ipython | let g:last_ipy_terminal_job_id = b:terminal_job_id |
  \ execute "normal ".g:parent_win."\<c-w>w"
autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3
  \ :let g:parent_win =  winnr() |
  \ vsp term\://ipython3 |
  \ let g:last_ipy_terminal_job_id = b:terminal_job_id |
  \ execute "normal ".g:parent_win."\<c-w>w"

command! IPython IPython3

" command! Ipdb :vsp term://python3 expand("%:p")
command! Ipdb
    \ :let current_file = expand("%:p")
    \ | vsp +term
    \ | silent call minpy#send2repl(["python3 ".current_file])
    " \ | let g:last_ipy_terminal_job_id = b:terminal_job_id
    " \ | let g:last_ipdb_terminal_job_id = b:terminal_job_id

command! Debug :Ipdb
command! CloseBuf :bd!

