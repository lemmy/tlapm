------------- MODULE box_closure_operator_stest --------------

\* The time of a fact is Always if the fact is box-closed, and tlapm
\* takes an application of a constant operator to box-closed arguments
\* to be box-closed.  But F negates its argument, so the assumption is
\* <>(x # 0), which PTL then wrongly receives as [](<>(x # 0)).  The
\* theorem is false for a behavior where x is 1 and then 0 forever.

EXTENDS TLAPS

VARIABLE x

F(a) == ~a

THEOREM ASSUME F([](x = 0)) PROVE [](F([](x = 0)))
BY PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
