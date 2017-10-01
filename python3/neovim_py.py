# import datetime as dt
import os
import re
# from collections import OrderedDict
import vim

def get_python_file_line_number(line=None):
  if not line:
      line = vim.eval("getline(line('.'))")

  digit_pattern = "\d+"
  line_number = re.search(digit_pattern, line)

  if line_number is not None:
      line_number = line_number.group()
  else:
      line_number = '1'

  return line_number

