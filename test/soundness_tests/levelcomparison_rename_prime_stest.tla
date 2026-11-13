------------- MODULE levelcomparison_rename_prime_stest --------------

EXTENDS TLAPS

VARIABLE x

\* c' = 1 fixes the constant c, not a different constant d.
THEOREM Prime ==
  ASSUME NEW c, NEW d, c' = 1 PROVE d' = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
