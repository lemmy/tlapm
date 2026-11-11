------------- MODULE step_time_new_bound_take_test --------------

\* Constant bounds must preserve necessitation of derived facts.  The
\* named theorem, preceding variable, and dependent bounds exercise the
\* context used to interpret each domain, including bounds from TAKE.

EXTENDS TLAPS

CONSTANT k
VARIABLE x

THEOREM StableBounds ==
  ASSUME NEW a \in {k},
         NEW b \in {a}
  PROVE [](b = k)
<1>1. b = k
    OBVIOUS
<1> QED
    BY <1>1, PTL

THEOREM \A a \in {k} : \A b \in {a} : [](b = k)
<1> TAKE a \in {k}
<1> TAKE b \in {a}
<1>1. b = k
    OBVIOUS
<1> QED
    BY <1>1, PTL

============================================================
