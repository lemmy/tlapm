------------- MODULE step_time_new_bound_stest --------------

\* A proof step holds at all times only if it depends on no assumption
\* that holds now.  check_time_change looks only at the facts in the
\* context and not at the bound of NEW c, so <1>1 counts as holding at
\* all times and PTL boxes it.  The theorem is false: c is x in the
\* first state only.  With c = x as an assumption, PTL fails.

EXTENDS TLAPS

VARIABLE x

THEOREM ASSUME NEW c \in {x} PROVE [](c = x)
<1>1. c = x
    OBVIOUS
<1> QED
    BY <1>1, PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
