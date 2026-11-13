------------- MODULE levelcomparison_rename_temporal_stest --------------

EXTENDS TLAPS

VARIABLE x

\* P does not imply a second temporal formula Q.
THEOREM Temporal ==
  ASSUME NEW TEMPORAL P, NEW TEMPORAL Q, P PROVE Q
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
