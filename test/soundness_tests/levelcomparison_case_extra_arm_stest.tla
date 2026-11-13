------------- MODULE levelcomparison_case_extra_arm_stest --------------

EXTENDS TLAPS

\* The left CASE is 1.  The extra arm on the right may be selected, so
\* the value may be 2.
THEOREM ExtraArm ==
  ASSUME (CASE TRUE -> 1) = 1
  PROVE (CASE TRUE -> 1 [] TRUE -> 2) = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
