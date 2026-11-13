------------- MODULE levelcomparison_rename_both_stest --------------

EXTENDS TLAPS

VARIABLE x

\* A different operator on a different argument.
THEOREM Both ==
  ASSUME NEW F(_), NEW G(_), NEW c, NEW d, F(c) PROVE G(d)
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
