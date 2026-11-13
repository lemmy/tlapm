------------- MODULE levelcomparison_bound_bounded_stest --------------

EXTENDS TLAPS

LEMMA AllReflS == ASSUME NEW S PROVE \A c \in S : c = c
OBVIOUS

\* c = d fails for an element d of S other than c.
THEOREM Bounded ==
  ASSUME NEW S, NEW c PROVE \A d \in S : c = d
BY AllReflS, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
