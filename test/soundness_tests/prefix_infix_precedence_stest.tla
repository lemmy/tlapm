------------- MODULE prefix_infix_precedence_stest --------------

\* SUBSET has precedence 10-13 and \cap has precedence 8, so SANY (and
\* TLC) read the expression below as {} \in ((SUBSET {}) \cap {}), which
\* is FALSE.  The tlapm parser must not read it as {} \in SUBSET ({} \cap
\* {}), which is TRUE.

THEOREM {} \in SUBSET {} \cap {}
OBVIOUS

============================================================
related to: https://github.com/tlaplus/tlapm/issues/213
