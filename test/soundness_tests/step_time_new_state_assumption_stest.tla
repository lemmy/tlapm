------------- MODULE step_time_new_state_assumption_stest --------------

\* Unlike NEW STATE c \in {0}, this syntax is accepted by SANY.
\* The separate state-level assumption c \in {0} holds only now.
\* The theorem is false: c may change from 0 to 1.

EXTENDS TLAPS

THEOREM ASSUME NEW STATE c,
               c \in {0}
        PROVE [](c = 0)
<1>1. c = 0
    OBVIOUS
<1> QED
    BY <1>1, PTL

============================================================
