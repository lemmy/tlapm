------------- MODULE levelcomparison_bound_membership_stest --------------

EXTENDS TLAPS

LEMMA AllMem == \A c : c \in {c}
OBVIOUS

\* c is not a member of {d} when d # c.
THEOREM Membership ==
  ASSUME NEW c PROVE \A d : c \in {d}
BY AllMem, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
