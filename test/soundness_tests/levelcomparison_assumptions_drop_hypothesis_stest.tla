------------- MODULE levelcomparison_assumptions_drop_hypothesis_stest --------------

EXTENDS TLAPS

\* c = 1 is what makes the inner proof work.  d is not 1.
THEOREM DropHypothesis ==
  ASSUME ASSUME NEW c, c = 1 PROVE c = 1,
         NEW d
  PROVE d = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
