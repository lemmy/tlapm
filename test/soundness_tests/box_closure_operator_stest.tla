------------- MODULE box_closure_operator_stest --------------

\* The time of a fact is Always if the fact is box-closed.  An
\* application of a constant operator to box-closed arguments need not be
\* box-closed: F negates its argument, so the assumption is <>(x # 0),
\* which PTL must not receive as [](<>(x # 0)).  The theorem is false for
\* a behavior where x is 1 and then 0 forever.

EXTENDS TLAPS

VARIABLE x

F(a) == ~a

THEOREM ASSUME F([](x = 0)) PROVE [](F([](x = 0)))
BY PTL

============================================================
