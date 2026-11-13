--------------- MODULE levelcomparison_case_forms_stest ---------------

\* LevelComparison compares only the first arm of a CASE.  Later arms
\* are ignored, including an arm nested inside the first arm.  The
\* assumed equality is true.  Each goal is false, or, when both arms
\* can be enabled, not a theorem.

EXTENDS TLAPS

\* The second guard is FALSE on the left, so the value is 1.  On the
\* right both arms are enabled, so the value may be 9.
THEOREM SecondGuard ==
  ASSUME (CASE TRUE -> 1 [] FALSE -> 9) = 1
  PROVE (CASE TRUE -> 1 [] TRUE -> 9) = 1
BY LevelComparison

\* The third arm is 1 on the left and 2 on the right.
THEOREM ThirdArm ==
  ASSUME (CASE FALSE -> 0 [] FALSE -> 0 [] TRUE -> 1) = 1
  PROVE (CASE FALSE -> 0 [] FALSE -> 0 [] TRUE -> 2) = 1
BY LevelComparison

\* The left CASE is 1.  The extra arm on the right may be selected, so
\* the value may be 2.
THEOREM ExtraArm ==
  ASSUME (CASE TRUE -> 1) = 1
  PROVE (CASE TRUE -> 1 [] TRUE -> 2) = 1
BY LevelComparison

\* The outer first arms agree.  The inner second arm is 2 on the left
\* and 3 on the right, and that inner arm is the one that is enabled.
THEOREM Nested ==
  ASSUME (CASE TRUE -> (CASE FALSE -> 1 [] TRUE -> 2) [] OTHER -> 0) = 2
  PROVE (CASE TRUE -> (CASE FALSE -> 1 [] TRUE -> 3) [] OTHER -> 0) = 2
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
