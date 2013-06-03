" Vim compiler file
" Compiler:Salesforce Deploy
" Maintainer:	Ian (ViViDboarder@gmail.com)
" Last Change:	2013 Apr 18

if exists("current_compiler")
  finish
endif
let current_compiler = "AbuseTheForce"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

"CompilerSet errorformat&
"CompilerSet errorformat+=%f(%l\\,%v):%m,
"           \%trror%*[^:]:\ %m,
"            \%tarning%*[^:]:\ %m

"set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set efm=%f:%l:%c\ %t\ in\ %m
CompilerSet makeprg=abusetheforce\ deploy\ file\ %
