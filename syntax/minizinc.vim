" Vim syntax file
" Language:     MiniZinc

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "minizinc"

" Zinc is case sensitive.
syntax case match

syntax region  zincComment     start=+%+ end=+$+ contains=zincToDo,@Spell
syntax region  cComment        start="/\*" end="\*/" contains=zincToDo,@Spell

syntax keyword zincType        ann any array bool enum float int list of record
syntax keyword zincType        set string tuple par var

" 'in' can be an operator, but we treat it as a keyword because it's mostly
" used in generators.
syntax keyword zincKeyword     annotation assert case constraint
syntax keyword zincKeyword     else elseif endif function if in include let
syntax keyword zincKeyword     minimize maximize op output predicate satisfy
syntax keyword zincKeyword     solve test then type where

syntax match   zincInt         "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syntax match   zincFloat       "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syntax match   zincFloat       "\<[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

syntax keyword zincOp          not xor subset superset
syntax keyword zincOp          union diff symdiff intersect div mod
syntax match   zincOp          &\.\.\|+\|-\|\*\|\/\|++&
syntax match   zincOp          +<->\|<-\|->\|/\\\|\\/+
" Although '=' can be an operator, don't highlight it because it's mostly used
" in definitions.
syntax match   zincOp          +==\|!=\|<>\|=<\|<=\|<\|>=\|=>\|>\|>+
syntax match   zincOp          +\.\.\.+

syntax keyword zincToDo        XXX TODO NOTE
syntax region  zincString      start=+"+ skip=+\\.+ end=+"+ contains=zincStringFmt
syntax match   zincStringFmt   +\\[abfnrtv]\|\\x[0-9a-fA-F]*\\\|%[-+# *.0-9]*[dioxXucsfeEgGp]+ contained

syntax sync fromstart

highlight link zincComment          Comment
highlight link cComment             Comment
highlight link zincType             Type
highlight link zincInt              Number
highlight link zincFloat            Number
highlight link zincKeyword          Keyword
highlight link zincToDo             Todo
highlight link zincOp               Operator
highlight link zincString           String
highlight link zincStringFmt        Special
highlight link zincAtom             Constant
