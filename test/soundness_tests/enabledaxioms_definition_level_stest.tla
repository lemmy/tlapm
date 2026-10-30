------------- MODULE enabledaxioms_definition_level_stest --------------

\* ENABLEDaxioms may use only facts that hold in all next states, so it
\* rejects assumptions of level 2.  It must not skip a fact that is the
\* name of a definition and so accept the action B: the equiv rule would
\* turn B into the goal, which is TRUE <=> FALSE.

EXTENDS TLAPS

VARIABLE x

B == (x' = 1) <=> FALSE

THEOREM ASSUME B PROVE ENABLED (x' = 1) <=> ENABLED FALSE
BY ENABLEDaxioms DEF B

============================================================
