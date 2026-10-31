------------- MODULE levelcomparison_rename_stest --------------

\* LevelComparison proves the goal if a hypothesis turns into it by a
\* renaming of identifiers that does not raise their levels.  Only the
\* identifiers that the hypothesis itself declares may be renamed, so
\* c = 1 must not turn into d = 1: the theorem is false for c # d.

EXTENDS TLAPS

THEOREM ASSUME NEW c, NEW d, c = 1 PROVE d = 1
BY LevelComparison

============================================================
