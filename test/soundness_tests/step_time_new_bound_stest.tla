------------- MODULE step_time_new_bound_stest --------------

\* A proof step holds at all times only if it depends on no assumption
\* that holds now.  The bound of NEW c holds only now, so <1>1 must not
\* count as holding at all times, and PTL must not box it.  The theorem
\* is false: c is x in the first state only.

EXTENDS TLAPS

VARIABLE x

THEOREM ASSUME NEW c \in {x} PROVE [](c = x)
<1>1. c = x
    OBVIOUS
<1> QED
    BY <1>1, PTL

============================================================
