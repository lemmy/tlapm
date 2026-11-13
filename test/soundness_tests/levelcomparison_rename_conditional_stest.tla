------------- MODULE levelcomparison_rename_conditional_stest --------------

EXTENDS TLAPS

VARIABLE x

\* The THEN branch is c on the left and d on the right.
THEOREM Conditional ==
  ASSUME NEW c, NEW d, (IF TRUE THEN c ELSE 0) = 1
  PROVE (IF TRUE THEN d ELSE 0) = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
