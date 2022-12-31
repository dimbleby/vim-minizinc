" Vim syntax file
" Language:     MiniZinc

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "minizinc"

" Zinc is case sensitive.
syntax case match

syntax region  zincComment     start=+%+ end=+$+ contains=zincToDo,@Spell

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
syntax match   zincOp          &\.\.\|+\|-\|\*\|\/\|\^\|++&
syntax match   zincOp          +<->\|<-\|->\|/\\\|\\/+
" Although '=' can be an operator, don't highlight it because it's mostly used
" in definitions.
syntax match   zincOp          +==\|!=\|<>\|=<\|<=\|<\|>=\|=>\|>\|>+
syntax match   zincOp          +\.\.\.+

syntax keyword zincToDo        XXX TODO NOTE
syntax region  zincString      start=+"+ skip=+\\.+ end=+"+ contains=zincStringFmt
syntax match   zincStringFmt   +\\[abfnrtv]\|\\x[0-9a-fA-F]*\\\|%[-+# *.0-9]*[dioxXucsfeEgGp]+ contained

syntax keyword zincFun         abs sum product max min forall exists card
syntax keyword zincFun         ceil floor round bool2int int2float set2array
syntax keyword zincFun         sqrt pow exp ln log sin cos
syntax keyword zincFun         show show_int show_float concat join

" Global constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html
"
" Counting constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#counting-constraints
syntax keyword zincGlobal      among at_most1 count count_eq count_geq count_gt count_leq count_lt count_neq distribute global_cardinality global_cardinality_closed global_cardinality_low_up global_cardinality_low_up_closed

" All-Different and co: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#all-different-and-related-constraints
syntax keyword zincGlobal      all_different all_disjoint all_equal alldifferent_except alldifferent_except_0 symmetric_all_different nvalue

" Lexicographic constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#lexicographic-constraints
syntax keyword zincGloal       lex2 lex2_strict lex_chain lex_chain_greater lex_chain_greatereq lex_chain_greatereq_orbitope lex_chain_less lex_chain_lesseq lex_chain_lesseq_orbitope lex_greater lex_greatereq lex_less lex_lesseq seq_precede_chain strict_lex2 value_precede value_precede_chain

" Sorting constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#sorting-constraints
syntax keyword zincGlobal      arg_sort sort increasing decreasing strictly_increasing strictly_decreasing

" Channeling constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#channeling-constraints
syntax keyword zincGlobal      int_set_channel inverse inverse_in_range inverse_set link_set_to_booleans

" Packing constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#packing-constraints
syntax keyword zincGlobal      bin_packing bin_packing_capa bin_packing_load diffn diffn_k diffn_nonstrict diffn_nonstrict_k geost geost_bb geost_nonoverlap_k geost_smallest_bb knapsack

" Scheduling constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#scheduling-constraints
syntax keyword zincGlobal      alternative cumulative disjunctive disjunctive_strict span

" Graph constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#graph-constraints
syntax keyword zincGlobal      bounded_dpath bounded_path connected d_weighted_spanning_tree dag dconnected dpath dreachable dsteiner dtree path reachable steiner subgraph tree weighted_spanning_tree

" Extensional constraints: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#extensional-constraints-table-regular-etc
syntax keyword zincGlobal      cost_mdd cost_regular mdd mdd_nondet regular regular_nfa table

" Machine learning constraints
syntax keyword zincGlobal      neural_net

" Other declarations: https://www.minizinc.org/doc-2.5.5/en/lib-globals.html#other-declarations
syntax keyword zincGlobal      arg_max arg_min circuit disjoint maximum maximum_arg member minimum minimum_arg network_flow network_flow_cost partition_set piecewise_linear range roots sliding_sum subcircuit sum_pred sum_set

syntax region  cComment   start="/\*" end=".*\*/" contains=zincToDo

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
highlight link zincFun              Function
highlight link zincGlobal           Function
