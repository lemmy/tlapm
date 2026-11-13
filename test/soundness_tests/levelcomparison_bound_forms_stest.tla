--------------- MODULE levelcomparison_bound_forms_stest ---------------

\* The bound of a \A or \E is read under the name of the hypothesis
\* quantifier.  An outer constant of that same name is then
\* indistinguishable from the bound.  Each theorem is false: the
\* hypothesis is true and the goal is not.

EXTENDS TLAPS

LEMMA AllRefl == \A c : c = c
OBVIOUS

LEMMA AllMem == \A c : c \in {c}
OBVIOUS

LEMMA AllReflS == ASSUME NEW S PROVE \A c \in S : c = c
OBVIOUS

LEMMA ExRefl0 == \E c \in {0} : c = c
OBVIOUS

LEMMA TwoRefl == \A c, e : c = c
OBVIOUS

LEMMA NestRefl == \A c : \A e : c = c
OBVIOUS

\* d = c for every d, not merely d = d.
THEOREM Swap ==
  ASSUME NEW c PROVE \A d : d = c
BY AllRefl, LevelComparison

\* c is not a member of {d} when d # c.
THEOREM Membership ==
  ASSUME NEW c PROVE \A d : c \in {d}
BY AllMem, LevelComparison

\* c = d fails for an element d of S other than c.
THEOREM Bounded ==
  ASSUME NEW S, NEW c PROVE \A d \in S : c = d
BY AllReflS, LevelComparison

\* \E c \in {0} : c = c is 0 = 0.  The goal is c = 0.
THEOREM Exists ==
  ASSUME NEW c PROVE \E d \in {0} : c = d
BY ExRefl0, LevelComparison

\* The second bound is unused on the left.  The goal says c equals
\* every d.
THEOREM TwoBinders ==
  ASSUME NEW c PROVE \A d, f : c = d
BY TwoRefl, LevelComparison

\* Same confusion under a second quantifier.
THEOREM Nested ==
  ASSUME NEW c PROVE \A d : \A f : c = d
BY NestRefl, LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
