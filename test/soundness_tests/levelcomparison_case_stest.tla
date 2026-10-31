------------- MODULE levelcomparison_case_stest --------------

\* LevelComparison must compare all arms of two CASE expressions, not
\* only the first, or it takes <1>1 to be the goal.  The theorem is
\* false: the CASE is 3.

EXTENDS TLAPS

THEOREM (CASE FALSE -> 1 [] TRUE -> 3) = 2
<1>1. (CASE FALSE -> 1 [] TRUE -> 2) = 2
    OBVIOUS
<1> QED
    BY <1>1, LevelComparison

============================================================
