------------- MODULE levelcomparison_case_stest --------------

\* LevelComparison compares only the first arm of two CASE expressions,
\* so it takes <1>1 to be the goal.  The theorem is false: the CASE is 3.

EXTENDS TLAPS

THEOREM (CASE FALSE -> 1 [] TRUE -> 3) = 2
<1>1. (CASE FALSE -> 1 [] TRUE -> 2) = 2
    OBVIOUS
<1> QED
    BY <1>1, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
