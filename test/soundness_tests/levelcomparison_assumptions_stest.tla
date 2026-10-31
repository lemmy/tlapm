------------- MODULE levelcomparison_assumptions_stest --------------

\* LevelComparison compares the conclusion of a sequent fact with the
\* goal and does not discharge the assumptions of the sequent.  So it
\* must not take the lemma ASSUME FALSE PROVE FALSE, which is valid, to
\* prove FALSE.

EXTENDS TLAPS

LEMMA L == ASSUME FALSE PROVE FALSE
OBVIOUS

THEOREM FALSE
BY L, LevelComparison

============================================================
