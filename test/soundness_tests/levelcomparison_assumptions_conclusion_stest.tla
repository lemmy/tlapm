------------- MODULE levelcomparison_assumptions_conclusion_stest --------------

EXTENDS TLAPS

\* FALSE proves 1 = 0 inside the sequent.  It does not prove 1 = 0 here.
THEOREM Conclusion ==
  ASSUME ASSUME FALSE PROVE 1 = 0
  PROVE 1 = 0
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
