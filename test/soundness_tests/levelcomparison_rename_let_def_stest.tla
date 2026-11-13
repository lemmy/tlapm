------------- MODULE levelcomparison_rename_let_def_stest --------------

EXTENDS TLAPS

VARIABLE x

\* LET O == 0 IN O is 0, which is not LET O == 2 IN O.
THEOREM LetDef ==
  ASSUME NEW c, NEW d, (LET O == c IN O) = 1
  PROVE (LET O == d IN O) = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
