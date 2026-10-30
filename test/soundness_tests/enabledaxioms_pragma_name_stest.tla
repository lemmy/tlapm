------------- MODULE enabledaxioms_pragma_name_stest --------------

\* ENABLEDaxioms may use only facts that hold in all next states, so it
\* rejects assumptions of level 2.  tlapm runs that check only if the
\* pragma is named ENABLEDaxioms, so MyAxioms, the same pragma under
\* another name, accepts the action assumption.  The equiv rule then
\* turns it into the goal, which is TRUE <=> FALSE.

EXTENDS TLAPS

VARIABLE x

MyAxioms == TRUE (*{ by (prover:"enabledaxioms") }*)

THEOREM ASSUME (x' = 1) <=> FALSE PROVE ENABLED (x' = 1) <=> ENABLED FALSE
BY MyAxioms

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
