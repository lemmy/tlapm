------------- MODULE levelcomparison_assumptions_several_hypotheses_stest --------------

EXTENDS TLAPS

\* c = 1 and c \in {1} are both dropped.  d \in {1} fails for d = 2.
THEOREM SeveralHypotheses ==
  ASSUME ASSUME NEW c, c = 1, c \in {1} PROVE c \in {1},
         NEW d
  PROVE d \in {1}
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
