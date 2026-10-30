------------- MODULE enabledaxioms_defined_actions_stest --------------

\* ENABLEDaxioms derives ENABLED (A /\ B) from (ENABLED A) /\ ENABLED B
\* only if A and B have disjoint sets of primed variables.  The check
\* must collect the primed variables of the definitions of A and B, which
\* both prime x, and reject the rule, as it does with the definitions
\* written out.

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
