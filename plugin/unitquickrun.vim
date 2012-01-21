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

command! -nargs=* -range=0 -buffer -complete=customlist,unitquickrun#run UnitQuickRun
\ call unitquickrun#run(<q-args>, <count>, <line1>, <line2>)


nnoremap <silent> <buffer> <Plug>(unitquickrun) :<C-u>UnitQuickRun -mode n<CR>
if !hasmapto('<Plug>(unitequickrun)')
  nmap <silent> <unique> <Leader>u <Plug>(unitquickrun)
endif


let &cpo = s:save_cpo
unlet s:save_cpo
