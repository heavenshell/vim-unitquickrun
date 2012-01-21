" File: pythounit.vim
" Author: Shinya Ohyanagi <sohyanagi@gmail.com>
" Version: 0.0.1
" WebPage: http://github.com/heavenshell/vim-unitquickrun/
" Description: Rewrite g:quickrun_config when run python unittest file.
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

let s:save_cpo = &cpo
set cpo&vim

function! unitquickrun#pythonunit#run(config)
  let lineno = line('.')
  let line = getline('.')

  if line =~ '^\s*def\stest_*.'
    let defname = line
  else
    let pos = search('^\s*def\stest_*.', 'bwWn')
    let defname = getline(pos)
    if pos == 0
      return
    endif
  endif

  let defname = substitute(defname, '(.*$', '', '')
  let defname = substitute(defname, '^\s*def\s\|^def\s', '', '')
  let classpos = search('^class\sTest*.', 'bwWn')
  let classname = getline(classpos)
  let classname = substitute(classname, '(.*$', '', '')
  let classname = substitute(classname, '^class\s', '', '')
  let filepath = expand('%:p')
  let cmdopt = printf('%s:%s.%s', filepath, classname, defname)

  let g:quickrun_config['python.unit']['exec'] = '%c %o' . ' ' . cmdopt
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
