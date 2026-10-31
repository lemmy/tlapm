------------- MODULE enabledaxioms_pragma_name_stest --------------

\* ENABLEDaxioms may use only facts that hold in all next states, so it
\* rejects assumptions of level 2.  tlapm must run that check for every
\* pragma whose prover is enabledaxioms, not only for one named
\* ENABLEDaxioms, or MyAxioms accepts the action assumption.  The equiv
\* rule would then turn it into the goal, which is TRUE <=> FALSE.

EXTENDS TLAPS

VARIABLE x

MyAxioms == TRUE (*{ by (prover:"enabledaxioms") }*)

THEOREM ASSUME (x' = 1) <=> FALSE PROVE ENABLED (x' = 1) <=> ENABLED FALSE
BY MyAxioms

============================================================
