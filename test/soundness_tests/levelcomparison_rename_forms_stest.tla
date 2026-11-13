---------------- MODULE levelcomparison_rename_forms_stest ----------------

\* LevelComparison may rename a constant, state, action, or temporal
\* parameter that is declared in the same ASSUME as the goal.  That is
\* not an instantiation of a quantifier.  Each theorem is false.

EXTENDS TLAPS

VARIABLE x

\* F need not satisfy F(1) when it satisfies F(0).
THEOREM Apply ==
  ASSUME NEW F(_), NEW c, NEW d, F(c) PROVE F(d)
BY LevelComparison

\* Op(1, 2) need not equal Op(2, 1).
THEOREM Swap ==
  ASSUME NEW Op(_, _), NEW a, NEW b, Op(a, b) PROVE Op(b, a)
BY LevelComparison

\* A different operator on a different argument.
THEOREM Both ==
  ASSUME NEW F(_), NEW G(_), NEW c, NEW d, F(c) PROVE G(d)
BY LevelComparison

\* <<0>> = <<1>> does not yield <<2>> = <<1>>.
THEOREM Tuple ==
  ASSUME NEW c, NEW d, <<c>> = <<1>> PROVE <<d>> = <<1>>
BY LevelComparison

\* The record with field a = 0 is not the record with a = 2.
THEOREM Record ==
  ASSUME NEW c, NEW d, [a |-> c] = [a |-> 1] PROVE [a |-> d] = [a |-> 1]
BY LevelComparison

\* f[0] = 1 does not yield f[2] = 1.
THEOREM Function ==
  ASSUME NEW f, NEW c, NEW d, f[c] = 1 PROVE f[d] = 1
BY LevelComparison

\* c' = 1 fixes the constant c, not a different constant d.
THEOREM Prime ==
  ASSUME NEW c, NEW d, c' = 1 PROVE d' = 1
BY LevelComparison

\* s = 1 does not force a second state expression to be 1.
THEOREM State ==
  ASSUME NEW STATE s, NEW STATE t, s = 1 PROVE t = 1
BY LevelComparison

\* A and B are independent actions.  A can be x' = x while B is x' # x.
THEOREM Action ==
  ASSUME NEW ACTION A, NEW ACTION B, A = (x' = x) PROVE B = (x' = x)
BY LevelComparison

\* P does not imply a second temporal formula Q.
THEOREM Temporal ==
  ASSUME NEW TEMPORAL P, NEW TEMPORAL Q, P PROVE Q
BY LevelComparison

\* c \in {1, 2} and c = 1 leave d free to be 2.
THEOREM Bounded ==
  ASSUME NEW c \in {1, 2}, NEW d \in {1, 2}, c = 1 PROVE d = 1
BY LevelComparison

\* The conjunct c = 1 does not become d = 1.
THEOREM Conjunction ==
  ASSUME NEW c, NEW d, c = 1 /\ TRUE PROVE d = 1 /\ TRUE
BY LevelComparison

\* The THEN branch is c on the left and d on the right.
THEOREM Conditional ==
  ASSUME NEW c, NEW d, (IF TRUE THEN c ELSE 0) = 1
  PROVE (IF TRUE THEN d ELSE 0) = 1
BY LevelComparison

\* The bound z is the same.  The free constant is not: c = 1 leaves d = 2.
THEOREM UnderQuantifier ==
  ASSUME NEW c, NEW d, \A z : c = 1 PROVE \A z : d = 1
BY LevelComparison

\* LET O == 0 IN O is 0, which is not LET O == 2 IN O.
THEOREM LetDef ==
  ASSUME NEW c, NEW d, (LET O == c IN O) = 1
  PROVE (LET O == d IN O) = 1
BY LevelComparison

\* Replacing field a by 0 is not the same update as replacing it by 2.
THEOREM Except ==
  ASSUME NEW r, NEW c, NEW d, [r EXCEPT !.a = c] = [r EXCEPT !.a = 1]
  PROVE [r EXCEPT !.a = d] = [r EXCEPT !.a = 1]
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
