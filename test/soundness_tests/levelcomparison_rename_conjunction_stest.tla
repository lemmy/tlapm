------------- MODULE levelcomparison_rename_conjunction_stest --------------

EXTENDS TLAPS

VARIABLE x

\* The conjunct c = 1 does not become d = 1.
THEOREM Conjunction ==
  ASSUME NEW c, NEW d, c = 1 /\ TRUE PROVE d = 1 /\ TRUE
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
