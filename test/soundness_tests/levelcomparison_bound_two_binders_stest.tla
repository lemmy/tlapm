------------- MODULE levelcomparison_bound_two_binders_stest --------------

EXTENDS TLAPS

LEMMA TwoRefl == \A c, e : c = c
OBVIOUS

\* The second bound is unused on the left.  The goal says c equals
\* every d.
THEOREM TwoBinders ==
  ASSUME NEW c PROVE \A d, f : c = d
BY TwoRefl, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
