------------- MODULE abstraction_flexible_var_stest --------------

\* The action frontend must not abstract [](x = 0) and [](y = 0) as one
\* function of the current values of x and y: the two formulas depend on
\* the whole behavior.  The theorem is false for a behavior that starts
\* with x = y = 0 and then changes y but not x.

VARIABLES x, y

THEOREM x = y => ([](x = 0) => [](y = 0))
OBVIOUS

============================================================
