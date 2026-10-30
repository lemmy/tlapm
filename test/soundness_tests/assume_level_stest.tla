------------- MODULE assume_level_stest --------------

\* An assumption must be constant.  tlapm does not check the level of
\* ASSUME, takes x = 0 as an axiom that holds at all times, and proves
\* [](x = 0).  SANY reports "assumptions must be level 0 (Constant)".

EXTENDS TLAPS

VARIABLE x

ASSUME A == x = 0

THEOREM [](x = 0)
BY A, PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
related to: https://github.com/tlaplus/tlapm/issues/213
