------------- MODULE box_closure_operator_if_stest --------------

EXTENDS TLAPS

VARIABLES x, y

\* IF [](x = 0) THEN FALSE ELSE TRUE is ~[](x = 0).
Fif(a) == IF a THEN FALSE ELSE TRUE

THEOREM ASSUME Fif([](x = 0)) PROVE [](Fif([](x = 0)))
BY PTL

============================================================
