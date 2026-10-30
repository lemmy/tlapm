------------- MODULE new_bound_time_stest --------------

\* Before PTL, NEW c \in {x} becomes NEW c and the fact c \in {x}.  The
\* time of this fact is computed for {x} in a context that already holds
\* c, so x is read as c, the bound looks constant, and the fact is boxed.
\* The theorem is false: c is x in the first state only.  With c \in {x}
\* as a separate assumption, PTL fails.

EXTENDS TLAPS

VARIABLE x

THEOREM ASSUME NEW c \in {x} PROVE [](c \in {x})
BY PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
