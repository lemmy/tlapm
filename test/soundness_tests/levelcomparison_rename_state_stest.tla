------------- MODULE levelcomparison_rename_state_stest --------------

EXTENDS TLAPS

VARIABLE x

\* s = 1 does not force a second state expression to be 1.
THEOREM State ==
  ASSUME NEW STATE s, NEW STATE t, s = 1 PROVE t = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
