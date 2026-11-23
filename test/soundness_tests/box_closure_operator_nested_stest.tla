------------- MODULE box_closure_operator_nested_stest --------------

EXTENDS TLAPS

VARIABLES x, y

\* A second name for negation.  Expanding one definition still leaves an
\* operator application.
Fneg(a) == ~a
Fnest(a) == Fneg(a)

THEOREM ASSUME Fnest([](x = 0)) PROVE [](Fnest([](x = 0)))
BY PTL

============================================================
