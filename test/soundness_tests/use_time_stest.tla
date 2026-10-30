------------- MODULE use_time_stest --------------

\* USE b proves b from the assumption, which holds only now, but tlapm
\* gives the fact b the time Always because b is not the name of a fact.
\* So PTL receives it as []b.  The theorem is false for a behavior where
\* b is TRUE and then FALSE.

EXTENDS TLAPS

VARIABLE b

THEOREM ASSUME b PROVE []b
<1> USE b
<1> QED
    BY PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
