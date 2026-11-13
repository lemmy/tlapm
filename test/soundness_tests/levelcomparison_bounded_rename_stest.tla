---------- MODULE levelcomparison_bounded_rename_stest ----------

\* The domain sits on the declaration NEW c \in {1} inside the assumed
\* sequent.  c = 1 uses that domain.  d is declared with no domain, so
\* d = 1 is false for d # 1.

EXTENDS TLAPS

THEOREM
  ASSUME ASSUME NEW c \in {1} PROVE c = 1,
         NEW d
  PROVE d = 1
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
