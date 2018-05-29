echo "file sourced"

" ===============================================================================
" Default settings
" -------------------------------------------------------------------------------
"
if !exists('g:minpy_default_keys')
    let g:minpy_default_keys = 0
endif


if g:minpy_default_keys
augroup minpyGroup
    au!

    " map <silent> <leader>bp Oimport ipdb; ipdb.set_trace()<esc>
    " map <silent> <leader>Bp oimport ipdb; ipdb.set_trace()<esc>
    au FileType python map  ;bp <Plug>SetBreakPoint
    au FileType python map  ;Bp <Plug>SetBreakPointBelow

    nnoremap <leader>bd :call minpy#DelBreakPoints()<cr> " <Plug>DelBreakPoints
    " nmap gt <Plug>OpenLeftDebugFile
    " nmap gt :OpenLeftDebugFile<cr>
    " au TermOpen * nmap <buffer> gt :OpenLeftDebugFile<cr>
    "
    au TermOpen * nmap <buffer> gl <Plug>GoToDebugLine
    " au TermOpen * nmap <buffer> gt :call minpy#GoToDebugLine()<cr> 

    au FileType python map <F5> <Plug>Ipdb

    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3
      \ :vsp term\://ipython3 | let g:last_ipy_terminal_job_id = b:terminal_job_id

    " other mappings: ;p & ;pa/;pf (for paste) or ;ss / ;sf
    " do not use noremap otherwise conflicts possible
    " autocmd Filetype python nmap <silent> <c-s> "+yy :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id) \| let g:ipy_parent_buffer=expand('%:p') \| let g:parent_win = winnr()<cr>
    " autocmd Filetype python vmap <silent> <c-s> "+y :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id) \| let g:ipy_parent_buffer=expand('%:p') \| let g:parent_win = winnr()<cr>
    " autocmd Filetype python nnoremap <silent> ;pf :%y+<cr> :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id) \| let g:ipy_parent_buffer=expand('%:p') \| let g:parent_win = winnr()<cr>
     
    " autocmd Filetype python nmap <silent> <c-s> <Plug>PySendLine2Repl
    " autocmd Filetype python vmap <silent> <c-s> <Plug>PySendSelection2Repl
    " autocmd Filetype python nmap <silent> <c-s><c-s> <Plug>PySendFile2Repl

    augroup END
endif

" Example for <Plug> for go / golang:
" nnoremap <silent> <Plug>(go-run) :<C-u>call go#cmd#Run(!g:go_jump_to_error)<CR>
" au FileType go nmap <leader>r <Plug>(go-run)


