------------- MODULE levelcomparison_rename_stest --------------

\* LevelComparison proves the goal if a hypothesis turns into it by a
\* renaming of identifiers that does not raise their levels.  Only the
\* identifiers that the hypothesis itself declares may be renamed, but
\* the check accepts any identifier of the context.  So c = 1 turns into
\* d = 1, and tlapm proves the theorem, which is false for c # d.

EXTENDS TLAPS

THEOREM ASSUME NEW c, NEW d, c = 1 PROVE d = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
