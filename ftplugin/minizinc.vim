if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

" j is a relatively recent addition; silence warnings when setting it.
setlocal formatoptions-=t formatoptions+=croql
silent! setlocal formatoptions+=j
let b:undo_ftplugin = 'setlocal formatoptions<'

" Set the commentstring.
setlocal commentstring=%%s
let b:undo_ftplugin .= ' commentstring<'

let &cpoptions = s:cpo_save
unlet s:cpo_save
