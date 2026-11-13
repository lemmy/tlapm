------------- MODULE levelcomparison_rename_function_stest --------------

EXTENDS TLAPS

VARIABLE x

\* f[0] = 1 does not yield f[2] = 1.
THEOREM Function ==
  ASSUME NEW f, NEW c, NEW d, f[c] = 1 PROVE f[d] = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
