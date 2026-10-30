------------- MODULE record_duplicate_field_stest --------------

\* tlapm does not reject a record with a duplicate field, which SANY
\* does, and the back-ends conclude that the field equals both values.
\* The theorem implies 1 = 2.

THEOREM [a |-> 1, a |-> 2].a = 1 /\ [a |-> 1, a |-> 2].a = 2
OBVIOUS

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
related to: https://github.com/tlaplus/tlapm/issues/213
