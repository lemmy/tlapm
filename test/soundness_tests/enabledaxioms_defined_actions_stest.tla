------------- MODULE enabledaxioms_defined_actions_stest --------------

\* ENABLEDaxioms derives ENABLED (A /\ B) from (ENABLED A) /\ ENABLED B
\* only if A and B have disjoint sets of primed variables.  The check
\* collects primed variables without expanding definitions, so it finds
\* none in A and B and accepts the rule, although both prime x.  With
\* the definitions written out, ENABLEDaxioms rejects the same proof.

EXTENDS TLAPS

VARIABLE x

A == x' = 1
B == x' = 2

THEOREM ENABLED (A /\ B)
<1>1. A \in BOOLEAN
    BY DEF A
<1>2. B \in BOOLEAN
    BY DEF B
<1>3. (ENABLED A) /\ (ENABLED B)
    BY ExpandENABLED, AutoUSE
<1> QED
    BY <1>1, <1>2, <1>3, ENABLEDaxioms

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
