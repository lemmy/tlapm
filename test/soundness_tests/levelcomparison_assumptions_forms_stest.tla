------------- MODULE levelcomparison_assumptions_forms_stest -------------

\* LevelComparison compares the PROVE formula of an assumed sequent
\* with the goal and ignores the formulas assumed there.  Each outer
\* theorem is false.  Each assumed sequent is true.

EXTENDS TLAPS

\* FALSE proves 1 = 0 inside the sequent.  It does not prove 1 = 0 here.
THEOREM Conclusion ==
  ASSUME ASSUME FALSE PROVE 1 = 0
  PROVE 1 = 0
BY LevelComparison

\* c = 1 is what makes the inner proof work.  d is not 1.
THEOREM DropHypothesis ==
  ASSUME ASSUME NEW c, c = 1 PROVE c = 1,
         NEW d
  PROVE d = 1
BY LevelComparison

\* c = k is dropped and c is renamed to d.  d = k fails for d # k.
THEOREM SharedConstant ==
  ASSUME NEW k,
         ASSUME NEW c, c = k PROVE c = k,
         NEW d
  PROVE d = k
BY LevelComparison

\* The inner assumptions contradict each other, so 1 = 0 follows
\* there only.  1 = 0 is still false.
THEOREM Contradiction ==
  ASSUME NEW S,
         ASSUME NEW c, c \in S, c \notin S PROVE 1 = 0
  PROVE 1 = 0
BY LevelComparison

\* c = 1 and c \in {1} are both dropped.  d \in {1} fails for d = 2.
THEOREM SeveralHypotheses ==
  ASSUME ASSUME NEW c, c = 1, c \in {1} PROVE c \in {1},
         NEW d
  PROVE d \in {1}
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
