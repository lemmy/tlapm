------------- MODULE levelcomparison_assumptions_shared_constant_stest --------------

EXTENDS TLAPS

\* c = k is dropped and c is renamed to d.  d = k fails for d # k.
THEOREM SharedConstant ==
  ASSUME NEW k,
         ASSUME NEW c, c = k PROVE c = k,
         NEW d
  PROVE d = k
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
