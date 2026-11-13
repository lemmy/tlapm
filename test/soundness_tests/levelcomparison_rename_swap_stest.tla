------------- MODULE levelcomparison_rename_swap_stest --------------

EXTENDS TLAPS

VARIABLE x

\* Op(1, 2) need not equal Op(2, 1).
THEOREM Swap ==
  ASSUME NEW Op(_, _), NEW a, NEW b, Op(a, b) PROVE Op(b, a)
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
