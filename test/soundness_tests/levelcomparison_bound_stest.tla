------------- MODULE levelcomparison_bound_stest --------------

\* LevelComparison compares identifiers by name.  So the bound c of the
\* lemma matches the declared c of the theorem, and the lemma
\* \A c : c = c is taken to be the goal \A d : c = d.  The theorem is
\* false: not every value equals c.

EXTENDS TLAPS

LEMMA L == \A c : c = c
OBVIOUS

THEOREM ASSUME NEW c PROVE \A d : c = d
BY L, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
