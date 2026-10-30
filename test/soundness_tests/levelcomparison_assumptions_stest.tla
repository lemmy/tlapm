------------- MODULE levelcomparison_assumptions_stest --------------

\* LevelComparison compares only the conclusion of a sequent fact with
\* the goal and ignores the assumptions of the sequent.  So the lemma
\* ASSUME FALSE PROVE FALSE, which is valid, is taken to prove FALSE.

EXTENDS TLAPS

LEMMA L == ASSUME FALSE PROVE FALSE
OBVIOUS

THEOREM FALSE
BY L, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
