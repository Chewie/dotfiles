""
"" tiger.vim for vim-syntax in /u/a1/sigour_b/.vim/syntax
""
"" Made by SIGOURE Benoit
"" Login   <sigour_b@epita.fr>
""
"" Started on  Sat Jan  7 20:11:05 2006 SIGOURE Benoit
"" Last update Wed Mar  8 14:23:09 2006 SIGOURE Benoit
""

" Vim syntax file based on the C syntax file by Bram Moolenaar <Bram@vim.org>

" INSTALL instructions:
" install tiger-ftdetect.vim
" $ mkdir -p ~/.vim/syntax
" $ cp tiger-syntax.vim ~/.vim/syntax

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" A bunch of useful Tiger keywords
syn keyword	tigerStatement		break let in end of
syn keyword	tigerConditional	if then else
syn keyword	tigerRepeat		while for to do

syn keyword	tigerTodo		contained TODO FIXME XXX NOTE[S]

" tigerCommentGroup allows adding matches for special things in comments
syn cluster	tigerCommentGroup	contains=tigerTodo

" String constants (Note: there is no character constants in Tiger)
" Highlight special characters (those which have a backslash) differently
syn match	tigerSpecial		display contained "\\\(x\x\{2}\|\o\{3}\|a\|b\|f\|n\|r\|t\|v\|\\\|\"\)"
" Highlight invalid escapes
syn match	tigerSpecialError	display contained "\\[^0-9abfnrtvx\\\"]"
syn match	tigerSpecialError	display contained "\\x[^0-9a-fA-F]"
syn match	tigerSpecialError	display contained "\\x\x[^0-9a-fA-F]"
syn region	tigerString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=tigerSpecial,tigerSpecialError,Spell

syn match	tigerSpaceError		display excludenl "\s\+$"
syn match	tigerSpaceError		display " \+\t"me=e-1

"catch errors caused by wrong parenthesis and brackets
syn cluster	tigerParenGroup		contains=tigerParenError,tigerSpecial,tigerSpecialError,tigerCommentGroup,tigerNumber,tigerNumbersCom
syn region	tigerParen		transparent start='(' end=')' contains=ALLBUT,@tigerParenGroup,tigerErrInBracket,Spell
syn match	tigerParenError		display "[\])]"
syn match	tigerErrInParen		display contained "[\]]"
syn region	tigerBracket		transparent start='\[' end=']' contains=ALLBUT,@tigerParenGroup,tigerErrInParen,Spell
syn match	tigerErrInBracket	display contained "[);{}]"

" integer number (Note: octal or hexadecimal literals don't exist in Tiger.)
"                (Numbers starting with a 0 are not considered in a special way)
syn case ignore
syn match	tigerNumbers		display transparent "\<\d\|\.\d" contains=tigerNumber
" Same, but without octal error (for comments)
syn match	tigerNumbersCom		display contained transparent "\<\d\|\.\d" contains=tigerNumber
syn match	tigerNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn case match

syn region	tigerComment		matchgroup=tigerCommentStart start="/\*" end="\*/" contains=@tigerCommentGroup,tigerComment,@Spell

syn keyword	tigerType		int string

syn keyword	tigerStructure		type array
syn keyword	tigerStorageClass	var
syn keyword	tigerDecl		function primitive
syn keyword	tigerImport		import
syn keyword	tigerNil		nil
syn keyword	tigerBuiltin		chr concat exit flush getchar not ord print print_err print_int size strcmp streq substring

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tiger_syn_inits")
  if version < 508
    let did_tiger_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tigerCommentL		tigerComment
  HiLink tigerCommentStart	tigerComment
  HiLink tigerConditional	Conditional
  HiLink tigerRepeat		Repeat
  HiLink tigerNumber		Number
  HiLink tigerParenError	tigerError
  HiLink tigerErrInParen	tigerError
  HiLink tigerErrInBracket	tigerError
  HiLink tigerSpaceError	tigerError
  HiLink tigerSpecialError	tigerError
  HiLink tigerStructure		Structure
  HiLink tigerStorageClass	StorageClass
  HiLink tigerDefine		Macro
  HiLink tigerError		Error
  HiLink tigerStatement		Statement
  HiLink tigerType		Type
  HiLink tigerConstant		Constant
  HiLink tigerString		String
  HiLink tigerComment		Comment
  HiLink tigerSpecial		SpecialChar
  HiLink tigerTodo		Todo
  HiLink tigerDecl		Type
  HiLink tigerImport            Include
  HiLink tigerNil               Constant
  HiLink tigerBuiltin		Define

  delcommand HiLink
endif

let b:current_syntax = "tiger"

" vim: ts=8
