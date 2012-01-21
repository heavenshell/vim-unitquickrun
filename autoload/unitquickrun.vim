" File: unitquickrun.vim
" Author: Shinya Ohyanagi <sohyanagi@gmail.com>
" Version: 0.0.1
" WebPage: http://github.com/heavenshell/vim-unitquickrun/
" Description: Simple QuickRun.vim wrapper for rewrite g:quickrun_config
"              dynamically.
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>


let s:save_cpo = &cpo
set cpo&vim

function! unitquickrun#run(config, use_range, line1, line2)
  let config = deepcopy(g:quickrun_config)

  let l:filetype = &filetype
  let funcname = substitute(l:filetype, '\.', '', 'g')
  let F = function('unitquickrun#' . funcname . '#run')
  call call(F, [config])

  call quickrun#command(a:config, a:use_range, a:line1, a:line2)

  let g:quickrun_config = config
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
