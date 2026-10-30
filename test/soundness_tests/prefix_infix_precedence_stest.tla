------------- MODULE prefix_infix_precedence_stest --------------

\* SUBSET and \cap both have precedence 8.  SANY (and TLC) read the
\* expression below as {} \in ((SUBSET {}) \cap {}), which is FALSE.
\* tlapm's parser lets the infix operator take the argument of the
\* prefix one and reads {} \in SUBSET ({} \cap {}), which is TRUE.

THEOREM {} \in SUBSET {} \cap {}
OBVIOUS

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
related to: https://github.com/tlaplus/tlapm/issues/213
