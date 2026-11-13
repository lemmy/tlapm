------------- MODULE levelcomparison_rename_except_stest --------------

EXTENDS TLAPS

VARIABLE x

\* Replacing field a by 0 is not the same update as replacing it by 2.
THEOREM Except ==
  ASSUME NEW r, NEW c, NEW d, [r EXCEPT !.a = c] = [r EXCEPT !.a = 1]
  PROVE [r EXCEPT !.a = d] = [r EXCEPT !.a = 1]
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
