------------- MODULE instance_constant_level_test --------------

\* M!T holds because c is a constant.  tlapm must reject an expression
\* substituted for a constant parameter that is not constant, or with
\* c <- x it proves x' = x from I!T.  The theorem is false: it fails for
\* a step from x = 0 to x = 1.  SANY rejects the INSTANCE with "The level
\* of the expression or operator substituted for 'c' must be at most 0."

---- MODULE M ----
CONSTANT c
THEOREM T == c' = c
OBVIOUS
====

VARIABLE x

I == INSTANCE M WITH c <- x

THEOREM x' = x
BY I!T

=================================================================
result: 3
stderr: substituted for the CONSTANT c must be at most 0
\* related to: https://github.com/tlaplus/tlapm/issues/213
