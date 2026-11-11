------------------------ MODULE step_time_new_bound_test ------------------------

\* A step proved from NEW c \in {k} holds in every state: c is rigid and {k}
\* does not depend on the state.  CONSTANT k is declared before VARIABLE x,
\* so k's index lands on x unless the domain is read in the context before
\* c.  The same applies to the later domain {a}, which must be read in the
\* context that already holds a.  PTL must receive both facts boxed.

EXTENDS TLAPS

CONSTANT k
VARIABLE x

THEOREM ASSUME NEW c \in {k} PROVE [](c = k)
<1>1. c = k
    OBVIOUS
<1> QED
    BY <1>1, PTL

THEOREM
  ASSUME NEW a \in {k},
         NEW b \in {a}
  PROVE [](b = a)
<1>1. b = a
    OBVIOUS
<1> QED
    BY <1>1, PTL

=============================================================================
