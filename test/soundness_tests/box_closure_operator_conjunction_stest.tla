------------- MODULE box_closure_operator_conjunction_stest --------------

EXTENDS TLAPS

VARIABLES x, y

\* (~[](x = 0)) /\ [](y = 0) holds in the first state and fails once x
\* stays 0.
Fand(a, b) == (~a) /\ b

THEOREM ASSUME Fand([](x = 0), [](y = 0))
         PROVE [](Fand([](x = 0), [](y = 0)))
BY PTL

============================================================
known: https://github.com/tlaplus/tlapm/issues/338
