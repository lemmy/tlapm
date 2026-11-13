------------- MODULE levelcomparison_rename_apply_stest --------------

EXTENDS TLAPS

VARIABLE x

\* F need not satisfy F(1) when it satisfies F(0).
THEOREM Apply ==
  ASSUME NEW F(_), NEW c, NEW d, F(c) PROVE F(d)
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
