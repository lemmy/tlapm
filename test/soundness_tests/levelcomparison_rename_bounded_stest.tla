------------- MODULE levelcomparison_rename_bounded_stest --------------

EXTENDS TLAPS

VARIABLE x

\* c \in {1, 2} and c = 1 leave d free to be 2.
THEOREM Bounded ==
  ASSUME NEW c \in {1, 2}, NEW d \in {1, 2}, c = 1 PROVE d = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
