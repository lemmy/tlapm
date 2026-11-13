------------- MODULE levelcomparison_case_nested_stest --------------

EXTENDS TLAPS

\* The outer first arms agree.  The inner second arm is 2 on the left
\* and 3 on the right, and that inner arm is the one that is enabled.
THEOREM Nested ==
  ASSUME (CASE TRUE -> (CASE FALSE -> 1 [] TRUE -> 2) [] OTHER -> 0) = 2
  PROVE (CASE TRUE -> (CASE FALSE -> 1 [] TRUE -> 3) [] OTHER -> 0) = 2
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
