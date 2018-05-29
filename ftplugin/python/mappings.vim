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

    au TermOpen * nmap <buffer> gl <Plug>GoToDebugLine
    " au TermOpen * nmap <buffer> gt :call minpy#GoToDebugLine()<cr> 

    au FileType python map <F5> <Plug>Ipdb

    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3
      \ :vsp term\://ipython3 | let g:last_ipy_terminal_job_id = b:terminal_job_id
    augroup END
endif

" Example for <Plug> for go / golang:
" nnoremap <silent> <Plug>(go-run) :<C-u>call go#cmd#Run(!g:go_jump_to_error)<CR>
" au FileType go nmap <leader>r <Plug>(go-run)


