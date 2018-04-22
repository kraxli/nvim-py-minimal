"=============================================================================
" FILE: autoload/terminal
" AUTHOR: David Scherrer
" License: MIT license
"=============================================================================

let s:nvimpy_path = fnamemodify(expand('<sfile>'), ':p:h:h')
    \ . '/python3'
let s:debug_line_pattern = "-->"
let s:error_file_line_indicator = '^\>'


python3 << EOF
import sys
import vim
# Add sys.path
sys.path.insert(0, vim.eval('s:nvimpy_path'))
from neovim_py import *
EOF


" function! GetPythonFileLineNumber()
function! s:get_python_file_line_number()

python3 << EOF
line_num = get_python_file_line_number()
vim.command("let lNum = " + str(line_num))
EOF

return lNum
endfunction

function! s:find_pattern_backw(lnum, ...) "{{{
  " lnum: string - line number
  " ...: string - pattern to find. Default: '^\>'

  let lnum = a:lnum
  let pattern = a:0 == 2 ? a:2 : s:error_file_line_indicator
  let line = " "
  let line_found = 0

  while lnum > 1
    if lnum > 1
      let line_above = getline(lnum-1)
    endif

    let line = getline(lnum)
    if line =~ pattern
      "    \ || line =~ '^\S'
      let line_found = 1

      " hack to overcome line split problem without checking if the string contains a real file path
      " best would be to join all adjoint lines starting with a > (to do in python)
      " but hack works
      if line_above =~ pattern
       let line = line_above
      endif
      " end of hack

      break
    endif
    let lnum -= 1
  endwhile

  if line =~ ' ' || line =~ "" || line != pattern
    let line = expand('#:p')
  endif

  return line

  "https://vi.stackexchange.com/questions/5484/get-the-current-window-buffer-tabpage-in-vimscript
  " current_win = vim.current.window
  " let current_win = winnr()

  " current_buff = vim.current.buffer
  " let current_buff = bufnr("%")

endfunction "}}}


function! nvimipdb#debug_file_information()
let pyfile_line_num = <SID>get_python_file_line_number()
let filename_line = <SID>find_pattern_backw(line('.'))

python3 << EOF
try:
  line = vim.eval("filename_line")
  if " " in line:
    _filename = line.split(" ")[1].split("(")[0]
  else:
    _filename = line

  vim.command("let filename = " + "'" + _filename + "'")
except:
  vim.command("let filename = " + "'" + " " + "'")
EOF

return [filename, pyfile_line_num]
endfunction


function! nvimipdb#send2repl(lines, ...)
   " type(a:lines) == 3	  => list
   let l:terminal_id = a:0 > 0 ? a:1 : g:last_terminal_job_id
   call jobsend(l:terminal_id, add(a:lines, ''))
endfunction


function! nvimipdb#OpenDebugFile()
    let l:debug_file_info = nvimipdb#debug_file_information()
    execute "edit " . fnameescape(l:debug_file_info[0]) . "|" . l:debug_file_info[1]
endfunction


function! nvimipdb#GoToDebugLine()
    execute "?".s:debug_line_pattern
    let l:debug_file_info = nvimipdb#debug_file_information()
    " call nvim_feedkeys("\<c-w>h", "normal", 0)
    execute "normal \<c-w>h"
    execute "edit" . fnameescape(l:debug_file_info[0]) . "|" . l:debug_file_info[1]
endfunction


function! nvimipdb#DelBreakPoints()
    :g/\.set_trace()/d
endfunction


function! nvimipdb#ClearBpsFct()
    :call DelBreakPoints()
    :w!
endfunction



" function! InclBreakPoint()
"     " let i_numargs = a:0

"     let bp_line = "."

"     " if int(i_numargs) != 0
"     "   let bp_line = a:1
"     "   " this could be extended to be a list and then looping over the list to include bp at all lines in the list
"     " endif

"     append(line(bp_line)-1, "import ipdb; ipdb.set_trace()")

" endfunction
" map <leader>bp :call  InclBreakPoint()<cr>

