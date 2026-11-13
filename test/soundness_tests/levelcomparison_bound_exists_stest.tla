------------- MODULE levelcomparison_bound_exists_stest --------------

EXTENDS TLAPS

LEMMA ExRefl0 == \E c \in {0} : c = c
OBVIOUS

\* \E c \in {0} : c = c is 0 = 0.  The goal is c = 0.
THEOREM Exists ==
  ASSUME NEW c PROVE \E d \in {0} : c = d
BY ExRefl0, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
