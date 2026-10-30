------------- MODULE enabledaxioms_definition_level_stest --------------

\* ENABLEDaxioms may use only facts that hold in all next states, so it
\* rejects assumptions of level 2.  But it skips a fact that is the name
\* of a definition, so it accepts the action B.  The equiv rule then
\* turns B into the goal, which is TRUE <=> FALSE.

EXTENDS TLAPS

VARIABLE x

B == (x' = 1) <=> FALSE

THEOREM ASSUME B PROVE ENABLED (x' = 1) <=> ENABLED FALSE
BY ENABLEDaxioms DEF B

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
