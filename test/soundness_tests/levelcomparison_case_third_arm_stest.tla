------------- MODULE levelcomparison_case_third_arm_stest --------------

EXTENDS TLAPS

\* The third arm is 1 on the left and 2 on the right.
THEOREM ThirdArm ==
  ASSUME (CASE FALSE -> 0 [] FALSE -> 0 [] TRUE -> 1) = 1
  PROVE (CASE FALSE -> 0 [] FALSE -> 0 [] TRUE -> 2) = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
