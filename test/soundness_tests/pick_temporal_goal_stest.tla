------------- MODULE pick_temporal_goal_stest --------------

\* PICK adds its predicate as a fact with the time of the enclosing
\* goal.  The goal is temporal, so c = x counts as holding at all times
\* and PTL boxes it.  The theorem is false: x may change, and no constant
\* equals x in every state.  SANY accepts the proof.

EXTENDS TLAPS

VARIABLE x

THEOREM \E c : [](c = x)
<1> PICK c : c = x
    OBVIOUS
<1>1. [](c = x)
    BY PTL
<1> QED
    BY <1>1

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
