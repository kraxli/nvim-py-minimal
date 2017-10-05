" credits:  google/yapf
   
"    imap <C-P> <c-o>:call yapf#YAPF()<cr>
 
" example:
"    map <C-P> :call yapf#YAPF()<cr>
 
"   :'<,'>YAPF  " formats lines selected in visual mode

" function! yapf#yapf(style) range
"   " Determine range to format.
"   let l:line_ranges = a:firstline . '-' . a:lastline
"   let l:cmd = 'yapf --lines=' . l:line_ranges  . ' --style=' . a:style
 
"   " Call YAPF with the current buffer
"   let l:formatted_text = system(l:cmd, join(getline(1, '$'), "\n") . "\n")
 
"   " Update the buffer.
"   execute '1,' . string(line('$')) . 'delete'
"   call setline(1, split(l:formatted_text, "\n"))
 
"   " Reset cursor to first line of the formatted range.
"   call cursor(a:firstline, 1)
" endfunction
 
function! yapf#yapf(style) range
  " Determine range to format.
  let l:line_ranges = a:firstline . '-' . a:lastline
  let l:cmd = 'yapf --style=' . a:style . ' --lines=' . l:line_ranges 
  ". ' --style=' . a:style

  " Call YAPF with the current buffer
  if exists('*systemlist')
    let l:formatted_text = systemlist(l:cmd, join(getline(1, '$'), "\n") . "\n")
  else
    let l:formatted_text =
        \ split(system(l:cmd, join(getline(1, '$'), "\n") . "\n"), "\n")
  endif

  echo l:formatted_text
  echo l:cmd

  if v:shell_error
    echohl ErrorMsg
    echomsg printf('"%s" returned error: %s', l:cmd, l:formatted_text[-1])
    echohl None
    return
  endif

  " Update the buffer.
  execute '1,' . string(line('$')) . 'delete'
  call setline(1, l:formatted_text)

  " Reset cursor to first line of the formatted range.
call cursor(a:firstline, 1)

endfunction

" let g:yapf#style_pep8 = "{based_on_style: pep8, spaces_before_comment: 4, split_before_logical_operator: true, indent_width: 4}"
