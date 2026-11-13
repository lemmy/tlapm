------------- MODULE levelcomparison_assumptions_contradiction_stest --------------

EXTENDS TLAPS

\* The inner assumptions contradict each other, so 1 = 0 follows
\* there only.  1 = 0 is still false.
THEOREM Contradiction ==
  ASSUME NEW S,
         ASSUME NEW c, c \in S, c \notin S PROVE 1 = 0
  PROVE 1 = 0
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
