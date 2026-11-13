------------- MODULE levelcomparison_rename_record_stest --------------

EXTENDS TLAPS

VARIABLE x

\* The record with field a = 0 is not the record with a = 2.
THEOREM Record ==
  ASSUME NEW c, NEW d, [a |-> c] = [a |-> 1] PROVE [a |-> d] = [a |-> 1]
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
