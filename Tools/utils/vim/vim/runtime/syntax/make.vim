" Vim syntax file
" Language:	Makefile
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/make.vim
" Last Change:	2002 May 13

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" some special characters
syn match makeSpecial	"^\s*[@-]\+"
syn match makeNextLine	"\\\n\s*"

" some directives
syn match makePreCondit	"^\s*\(ifeq\>\|else\>\|endif\>\|ifneq\>\|ifdef\>\|ifndef\>\)"
syn match makeInclude	"^\s*[-s]\=include"
syn match makeStatement	"^\s*vpath"
syn match makeExport    "^\s*\(export\|unexport\)\>"
syn match makeOverride	"^\s*override"
hi link makeOverride makeStatement
hi link makeExport makeStatement

" Koehler: catch unmatched define/endef keywords.  endef only matches it is by itself on a line
syn region makeDefine start="^\s*define\s" end="^\s*endef\s*$" contains=makeStatement,makeIdent,makePreCondit,makeDefine

" Microsoft Makefile specials
syn case ignore
syn match makeInclude	"^!\s*include"
syn match makePreCondit "!\s*\(cmdswitches\|error\|message\|include\|if\|ifdef\|ifndef\|else\|elseif\|else if\|else\s*ifdef\|else\s*ifndef\|endif\|undef\)\>"
syn case match

" identifiers
syn region makeIdent	start="\$(" skip="\\)\|\\\\" end=")" contains=makeStatement,makeIdent,makeSString,makeDString
syn region makeIdent	start="\${" skip="\\}\|\\\\" end="}" contains=makeStatement,makeIdent,makeSString,makeDString
syn match makeIdent	"\$\$\w*"
syn match makeIdent	"\$[^({]"
syn match makeIdent	"^\s*\a\w*\s*[:+?!*]="me=e-2
syn match makeIdent	"^\s*\a\w*\s*="me=e-1
syn match makeIdent	"%"

" Makefile.in variables
syn match makeConfig "@[A-Za-z0-9_]\+@"

" make targets
" syn match makeSpecTarget	"^\.\(SUFFIXES\|PHONY\|DEFAULT\|PRECIOUS\|IGNORE\|SILENT\|EXPORT_ALL_VARIABLES\|KEEP_STATE\|LIBPATTERNS\|NOTPARALLEL\|DELETE_ON_ERROR\|INTERMEDIATE\|POSIX\|SECONDARY\)\>"
syn match makeImplicit		"^\.[A-Za-z0-9_./\t -]\+\s*:[^=]"me=e-2 nextgroup=makeSource
syn match makeImplicit		"^\.[A-Za-z0-9_./\t -]\+\s*:$"me=e-1 nextgroup=makeSource

syn region makeTarget	transparent matchgroup=makeTarget start="^[A-Za-z0-9_./$()%-][A-Za-z0-9_./\t $()%-]*:\{1,2}[^:=]"rs=e-1 end=";"re=e-1,me=e-1 end="[^\\]$" keepend contains=makeIdent,makeSpecTarget,makeNextLine skipnl nextGroup=makeCommands
syn match makeTarget		"^[A-Za-z0-9_./$()%*@-][A-Za-z0-9_./\t $()%*@-]*::\=\s*$" contains=makeIdent,makeSpecTarget skipnl nextgroup=makeCommands,makeCommandError

syn region makeSpecTarget	transparent matchgroup=makeSpecTarget start="^\.\(SUFFIXES\|PHONY\|DEFAULT\|PRECIOUS\|IGNORE\|SILENT\|EXPORT_ALL_VARIABLES\|KEEP_STATE\|LIBPATTERNS\|NOTPARALLEL\|DELETE_ON_ERROR\|INTERMEDIATE\|POSIX\|SECONDARY\)\>:\{1,2}[^:=]"rs=e-1 end="[^\\]$" keepend contains=makeIdent,makeSpecTarget,makeNextLine skipnl nextGroup=makeCommands
syn match makeSpecTarget		"^\.\(SUFFIXES\|PHONY\|DEFAULT\|PRECIOUS\|IGNORE\|SILENT\|EXPORT_ALL_VARIABLES\|KEEP_STATE\|LIBPATTERNS\|NOTPARALLEL\|DELETE_ON_ERROR\|INTERMEDIATE\|POSIX\|SECONDARY\)\>::\=\s*$" contains=makeIdent skipnl nextgroup=makeCommands,makeCommandError

syn match makeCommandError "^\s\+\S.*" contained
syn region makeCommands start=";"hs=s+1 start="^\t" end="^[^\t#]"me=e-1,re=e-1 end="^$" contained contains=makeCmdNextLine,makeSpecial,makeComment,makeIdent,makePreCondit,makeDefine,makeDString,makeSString nextgroup=makeCommandError
syn match makeCmdNextLine	"\\\n."he=e-1 contained


" Statements / Functions (GNU make)
syn match makeStatement contained "(\(subst\|addprefix\|addsuffix\|basename\|call\|dir\|error\|filter-out\|filter\|findstring\|firstword\|foreach\|if\|join\|notdir\|origin\|patsubst\|shell\|sort\|strip\|suffix\|warning\|wildcard\|word\|wordlist\|words\)\>"ms=s+1

" Comment
if exists("make_microsoft")
   syn match  makeComment "#.*" contains=makeTodo
else
   syn region  makeComment	start="#" end="^$" end="[^\\]$" contains=makeTodo
   syn match   makeComment	"#$"
endif
syn keyword makeTodo TODO FIXME XXX contained

" match escaped quotes and any other escaped character
" except for $, as a backslash in front of a $ does
" not make it a standard character, but instead it will
" still act as the beginning of a variable
" The escaped char is not highlightet currently
syn match makeEscapedChar	"\\[^$]"


syn region  makeDString start=+\(\\\)\@<!"+  skip=+\\.+  end=+"+  contains=makeIdent
syn region  makeSString start=+\(\\\)\@<!'+  skip=+\\.+  end=+'+  contains=makeIdent
syn region  makeBString start=+\(\\\)\@<!`+  skip=+\\.+  end=+`+  contains=makeIdent,makeSString,makeDString,makeNextLine

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_make_syn_inits")
  if version < 508
    let did_make_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink makeNextLine		makeSpecial
  HiLink makeCmdNextLine	makeSpecial
  HiLink makeSpecTarget		Statement
  HiLink makeCommands		Number
  HiLink makeImplicit		Function
  HiLink makeTarget		Function
  HiLink makeInclude		Include
  HiLink makePreCondit		PreCondit
  HiLink makeStatement		Statement
  HiLink makeIdent		Identifier
  HiLink makeSpecial		Special
  HiLink makeComment		Comment
  HiLink makeDString		String
  HiLink makeSString		String
  HiLink makeBString		Function
  HiLink makeError		Error
  HiLink makeTodo		Todo
  HiLink makeDefine		Define
  HiLink makeCommandError	Error
  HiLink makeConfig		PreCondit
  delcommand HiLink
endif

let b:current_syntax = "make"

" vim: ts=8
