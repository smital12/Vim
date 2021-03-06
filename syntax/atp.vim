" *.atp file type syntax highlighting
" Author: Murey A  Luna Torres
" Date: Nov 2016

if exists("b:current_syntax")
	finish
endif

" keywords
syn keyword imports import
syn keyword repeats  repeat 
syn keyword lastLine halt end_module return

" syntax for non-Data text in in the vector
syn match loops "\(set_\|end_\|\)loop[ABCD]" contained
syn match branchDest "\h\w*\ze," contained
syn match subroutine "\(call\|jump\) \zs\w\+" contained
syn region vectorPre start="^" end=">"me=e-1 oneline contains=subroutine,loops,branchDest

" labels on their own
syn match labels		"^\(.*\s\)\=\zs\w\+:"me=e-1

" syntax for vector data
syn match readDrive	"\.[dr]" contained
syn match hexNumber	"\x" contained
syn match logicRead "[LVH]" contained
syn match logicDontCare		"\.\?[-X]" contained
syn region vectorData  start="> \w\+\zs" end=";"me=e-1,he=e-1,re=e-1 contains=readDrive,logicRead,logicDontCare,hexNumber display

"comments
syn match atpComment "\/\/.*$"
syn match atpDevNote "\/\/\s*\*\+.*$"
syn match atpEndComment ";.*$"

" comment matching
syn region longComment start="\/\*"hs=s end="\*\/"he=e contains=atpComment
syn region longComment2 start="\/\/\s*=\+.*=\+$"hs=s end="\/\/\s*=\+.*=\+$"he=e

"syntax sync ccomment longComment
syntax sync fromstart

" The default methods for highlighting.  Can be overridden later
hi def link lastLine	Type
hi def link imports		Keyword
hi def link repeats		Macro
hi def link subroutine	Function
hi def link labels		Identifier
hi def link branchDest	Identifier
hi def link jumpgroup	Identifier
hi def link readDrive	Special
hi def link loops		Repeat
hi def link hexNumber	Number
hi def link logicRead	String
hi def link atpComment	Comment
hi def link logicDontCare	LineNr
hi def link atpEndComment	Comment
hi def link longComment		Type
hi def link longComment2	Type
hi def link atpDevNote		Type

let b:current_syntax = "atp"
