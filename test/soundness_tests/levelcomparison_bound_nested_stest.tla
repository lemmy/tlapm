------------- MODULE levelcomparison_bound_nested_stest --------------

EXTENDS TLAPS

LEMMA NestRefl == \A c : \A e : c = c
OBVIOUS

\* Same confusion under a second quantifier.
THEOREM Nested ==
  ASSUME NEW c PROVE \A d : \A f : c = d
BY NestRefl, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
