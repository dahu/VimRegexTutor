" Vim regextutor support file
" Maintainer:  Barry Arthur <barry.arthur@gmail.com>
" Last Change: 2011 Jul 22

" NOTE: This was shamelessly stolen from Eduardo F. Amatria's
" (<eferna1@platea.pntic.mec.es>) original tutor.vim.
" None of the language varients exist for vimregextutor yet, but Eduardo's
" code was left here in the vain hope that one day it would be useful. :)

" This Vim script is used for detecting if a translation of the
" regextutor file exists, i.e., a regextutor.xx file, where xx is the
" language.  If the translation does not exist, or no extension is given, it
" defaults to the English version.

" It is invoked by the vimregextutor shell script.

" 1. Build the extension of the file, if any:
let s:ext = ""
if strlen($xx) > 1
  let s:ext = "." . $xx
else
  let s:lang = ""
  " Check that a potential value has at least two letters.
  " Ignore "1043" and "C".
  if exists("v:lang") && v:lang =~ '\a\a'
    let s:lang = v:lang
  elseif $LC_ALL =~ '\a\a'
    let s:lang = $LC_ALL
  elseif $LANG =~ '\a\a'
    let s:lang = $LANG
  endif
  if s:lang != ""
    " Remove "@euro" (ignoring case), it may be at the end
    let s:lang = substitute(s:lang, '\c@euro', '', '')
    " On MS-Windows it may be German_Germany.1252 or Polish_Poland.1250.  How
    " about other languages?
    if s:lang =~ "German"
      let s:ext = ".de"
    elseif s:lang =~ "Polish"
      let s:ext = ".pl"
    elseif s:lang =~ "Slovak"
      let s:ext = ".sk"
    elseif s:lang =~ "Czech"
      let s:ext = ".cs"
    elseif s:lang =~ "Dutch"
      let s:ext = ".nl"
    else
      let s:ext = "." . strpart(s:lang, 0, 2)
    endif
  endif
endif

" Somehow ".ge" (Germany) is sometimes used for ".de" (Deutsch).
if s:ext =~? '\.ge'
  let s:ext = ".de"
endif

if s:ext =~? '\.en'
  let s:ext = ""
endif

" The japanese regextutor is available in two encodings, guess which one to use
" The "sjis" one is actually "cp932", it doesn't matter for this text.
if s:ext =~? '\.ja'
  if &enc =~ "euc"
    let s:ext = ".ja.euc"
  elseif &enc != "utf-8"
    let s:ext = ".ja.sjis"
  endif
endif

" The korean regextutor is available in two encodings, guess which one to use
if s:ext =~? '\.ko'
  if &enc != "utf-8"
    let s:ext = ".ko.euc"
  endif
endif

" The Chinese regextutor is available in two encodings, guess which one to use
" This segment is from the above lines and modified by
" Mendel L Chan <beos@turbolinux.com.cn> for Chinese vim regextutorial
if s:ext =~? '\.zh'
  if &enc =~ 'big5\|cp950'
    let s:ext = ".zh.big5"
  elseif &enc != 'utf-8'
    let s:ext = ".zh.euc"
  endif
endif

" The Polish regextutor is available in two encodings, guess which one to use.
if s:ext =~? '\.pl'
  if &enc =~ 1250
    let s:ext = ".pl.cp1250"
  endif
endif

" The Turkish regextutor is available in two encodings, guess which one to use
if s:ext =~? '\.tr'
  if &enc == "iso-8859-9"
    let s:ext = ".tr.iso9"
  endif
endif

" The Greek regextutor is available in three encodings, guess what to use.
" We used ".gr" (Greece) instead of ".el" (Greek); accept both.
if s:ext =~? '\.gr\|\.el'
  if &enc == "iso-8859-7"
    let s:ext = ".el"
  elseif &enc == "utf-8"
    let s:ext = ".el.utf-8"
  elseif &enc =~ 737
    let s:ext = ".el.cp737"
  endif
endif

" The Slovak regextutor is available in three encodings, guess which one to use
if s:ext =~? '\.sk'
  if &enc =~ 1250
    let s:ext = ".sk.cp1250"
  endif
endif

" The Czech regextutor is available in three encodings, guess which one to use
if s:ext =~? '\.cs'
  if &enc =~ 1250
    let s:ext = ".cs.cp1250"
  endif
endif

" The Russian regextutor is available in three encodings, guess which one to use.
if s:ext =~? '\.ru'
  if &enc =~ '1251'
    let s:ext = '.ru.cp1251'
  elseif &enc =~ 'koi8'
    let s:ext = '.ru'
  endif
endif

" The Hungarian regextutor is available in three encodings, guess which one to use.
if s:ext =~? '\.hu'
  if &enc =~ 1250
    let s:ext = ".hu.cp1250"
  elseif &enc =~ 'iso-8859-2'
    let s:ext = '.hu'
  endif
endif

" The Croatian regextutor is available in three encodings, guess which one to use.
if s:ext =~? '\.hr'
  if &enc =~ 1250
    let s:ext = ".hr.cp1250"
  elseif &enc =~ 'iso-8859-2'
    let s:ext = '.hr'
  endif
endif

" Esperanto is only available in utf-8
if s:ext =~? '\.eo'
  let s:ext = ".eo.utf-8"
endif
" Vietnamese is only available in utf-8
if s:ext =~? '\.vi'
  let s:ext = ".vi.utf-8"
endif

" If 'encoding' is utf-8 s:ext must end in utf-8.
if &enc == 'utf-8' && s:ext !~ '\.utf-8'
  let s:ext .= '.utf-8'
endif

" 2. Build the name of the file:
let s:regextutorfile = "/tutor/regextutor"
let s:regextutorxx = $VIMRUNTIME . s:regextutorfile . s:ext

" 3. Finding the file:
if filereadable(s:regextutorxx)
  let $REGEXTUTOR = s:regextutorxx
else
  let $REGEXTUTOR = $VIMRUNTIME . s:regextutorfile
  echo "The file " . s:regextutorxx . " does not exist.\n"
  echo "Copying English version: " . $REGEXTUTOR
  4sleep
endif

" 4. Making the copy and exiting Vim:
e $REGEXTUTOR
wq! $REGEXTUTORCOPY
