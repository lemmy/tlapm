------------- MODULE levelcomparison_case_second_guard_stest --------------

EXTENDS TLAPS

\* The second guard is FALSE on the left, so the value is 1.  On the
\* right both arms are enabled, so the value may be 9.
THEOREM SecondGuard ==
  ASSUME (CASE TRUE -> 1 [] FALSE -> 9) = 1
  PROVE (CASE TRUE -> 1 [] TRUE -> 9) = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
