------------- MODULE fresh_operator_args_stest --------------

\* The action frontend abstracts an application of a declared STATE
\* operator without its constant arguments, so F(1) and F(2) become the
\* same term.  The theorem is false: F may differ on 1 and 2.

THEOREM ASSUME NEW STATE F(_) PROVE F(1) = F(2)
OBVIOUS

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
