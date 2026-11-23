------------- MODULE box_closure_operator_forall_stest --------------

EXTENDS TLAPS

VARIABLES x, y

\* b does not occur, so \A b : ~[](x = 0) is ~[](x = 0).
Fall(a) == \A b : ~a

THEOREM ASSUME Fall([](x = 0)) PROVE [](Fall([](x = 0)))
BY PTL

============================================================
