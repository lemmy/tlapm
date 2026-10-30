------------- MODULE prime_lambda_param_stest --------------

\* The prime is distributed into the LAMBDA, and the parameter a, which
\* is not declared constant, is primed as well.  The primed parameter
\* becomes a free constant, so the LAMBDA no longer depends on a, and
\* the goal is taken to be an instance of the hypothesis with c := a'.
\* The hypothesis is true, since H(LAMBDA a : c) is c = c.  The goal
\* is 1 + x' = 2 + x', so the theorem is false: it fails for x' = 0.

EXTENDS Naturals

VARIABLE x

H(F(_)) == F(1) = F(2)

THEOREM ASSUME \A c : H(LAMBDA a : c)
        PROVE  H(LAMBDA a : a + x)'
OBVIOUS

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
