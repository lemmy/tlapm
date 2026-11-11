------------- MODULE step_time_new_state_bound_stest --------------

\* SANY rejects a domain on a NEW STATE declaration: bounded NEW
\* declarations are allowed only for constant parameters.  TLAPM accepts
\* this syntax and proves the false theorem; c may change from 0 to 1.

EXTENDS TLAPS

THEOREM ASSUME NEW STATE c \in {0} PROVE [](c = 0)
<1>1. c = 0
    OBVIOUS
<1> QED
    BY <1>1, PTL

============================================================
\* Known bug: TLAPM accepts the illegal NEW STATE c, which SANY rejects.
known: https://github.com/tlaplus/tlapm/issues/213

step_time_new_state_assumption_stest is the same theorem but with valid
syntax.  TLAPS correctly rejected step_time_new_state_assumption_stest.
