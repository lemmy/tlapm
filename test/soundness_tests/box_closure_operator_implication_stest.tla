------------- MODULE box_closure_operator_implication_stest --------------

EXTENDS TLAPS

VARIABLES x, y

\* a => ~a is ~a, so this is <>(x # 0).  That does not imply
\* [](<>(x # 0)).
Fimp(a) == a => ~a

THEOREM ASSUME Fimp([](x = 0)) PROVE [](Fimp([](x = 0)))
BY PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
