------------- MODULE levelcomparison_rename_under_quantifier_stest --------------

EXTENDS TLAPS

VARIABLE x

\* The bound z is the same.  The free constant is not: c = 1 leaves d = 2.
THEOREM UnderQuantifier ==
  ASSUME NEW c, NEW d, \A z : c = 1 PROVE \A z : d = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
