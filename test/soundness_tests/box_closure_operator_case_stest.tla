------------- MODULE box_closure_operator_case_stest --------------

EXTENDS TLAPS

VARIABLES x, y

\* CASE a -> FALSE [] OTHER -> TRUE is ~a.  The [] separates CASE arms.
Fcase(a) == CASE a -> FALSE [] OTHER -> TRUE

THEOREM ASSUME Fcase([](x = 0)) PROVE [](Fcase([](x = 0)))
BY PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/338
