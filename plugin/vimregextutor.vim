" Vim global plugin for learning and practicing Vim style regular expressions
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" Version:	0.1
" License:	Vim License (see :help license)
" Location:	plugin/vimregextutor.vim
" Website:	https://github.com/dahu/vimregextutor
"
" See vimregextutor.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help vimregextutor

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

"if exists("g:loaded_vimregextutor")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
let g:loaded_vimregextutor = 1

let s:script_file = expand('<sfile>:p:h:h')

" Public Interface: {{{1
function! VimRegexTutor()
  tabnew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  call setline(1, readfile(s:script_file . '/tutor/regextutor'))
  1
endfunction

" Commands: {{{1
command! -nargs=0 -bar VimRegexTutor call VimRegexTutor()
command! -nargs=0 -bar RegexTutor    call VimRegextutor()

" Teardown: {{{1
" reset &cpo back to users setting
let &cpo = s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
