------------- MODULE levelcomparison_rename_action_stest --------------

EXTENDS TLAPS

VARIABLE x

\* A and B are independent actions.  A can be x' = x while B is x' # x.
THEOREM Action ==
  ASSUME NEW ACTION A, NEW ACTION B, A = (x' = x) PROVE B = (x' = x)
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
