------------------- MODULE levelcomparison_test -------------------

\* Instantiations LevelComparison must keep proving.  A renamed
\* parameter is a NEW of an assumed sequent, or the two expressions
\* are identical.  The level of a renamed parameter does not increase.
\* A parameter that is not renamed keeps its declaration.

EXTENDS TLAPS

VARIABLE x

Foo == 1

\* NEW c is instantiated by d.
THEOREM Instantiate ==
  ASSUME ASSUME NEW c PROVE c = c,
         NEW d
  PROVE d = d
BY LevelComparison

\* A state parameter may be instantiated by a constant.
THEOREM StateToConstant ==
  ASSUME ASSUME NEW STATE s PROVE s = s,
         NEW CONSTANT c
  PROVE c = c
BY LevelComparison

\* An action parameter may be instantiated by a state expression.
THEOREM ActionToState ==
  ASSUME ASSUME NEW ACTION A PROVE A = A,
         NEW STATE s
  PROVE s = s
BY LevelComparison

\* A temporal parameter may be instantiated by a constant.
THEOREM TemporalToConstant ==
  ASSUME ASSUME NEW TEMPORAL P PROVE P <=> P,
         NEW CONSTANT c
  PROVE c <=> c
BY LevelComparison

\* c is renamed to d.  k is declared outside the sequent and stays k.
THEOREM Shared ==
  ASSUME NEW k,
         ASSUME NEW c PROVE c = c \/ c # k,
         NEW d
  PROVE d = d \/ d # k
BY LevelComparison

\* An operator parameter is instantiated by another operator.
THEOREM Operator ==
  ASSUME ASSUME NEW F(_) PROVE F(1) = F(1),
         NEW G(_)
  PROVE G(1) = G(1)
BY LevelComparison

\* e does not occur in the proved formula.
THEOREM Unused ==
  ASSUME ASSUME NEW c, NEW e PROVE c = c,
         NEW d
  PROVE d = d
BY LevelComparison

\* Two parameters, in order.
THEOREM Pair ==
  ASSUME ASSUME NEW a, NEW b PROVE a = a /\ b = b,
         NEW c, NEW d
  PROVE c = c /\ d = d
BY LevelComparison

\* c is renamed.  The shared constant k is not.
THEOREM Tuple ==
  ASSUME NEW k,
         ASSUME NEW c PROVE <<c, k>> = <<c, k>>,
         NEW d
  PROVE <<d, k>> = <<d, k>>
BY LevelComparison

\* The free constant is renamed.  The bound z is not.
THEOREM UnderQuantifier ==
  ASSUME ASSUME NEW c PROVE \A z : c = c,
         NEW d
  PROVE \A z : d = d
BY LevelComparison

\* A constant may be instantiated by a level-0 definition.
THEOREM Definition ==
  ASSUME ASSUME NEW c PROVE c = c
  PROVE Foo = Foo
BY LevelComparison

\* Record fields are compared by name.
THEOREM RecordOrder ==
  ASSUME [a |-> 1, b |-> 2] = [a |-> 1, b |-> 2]
  PROVE [b |-> 2, a |-> 1] = [a |-> 1, b |-> 2]
BY LevelComparison

\* Every arm agrees, including OTHER.
THEOREM CaseSame ==
  ASSUME (CASE FALSE -> 1 [] TRUE -> 2 [] OTHER -> 0) = 2
  PROVE (CASE FALSE -> 1 [] TRUE -> 2 [] OTHER -> 0) = 2
BY LevelComparison

THEOREM IfSame ==
  ASSUME (IF TRUE THEN 1 ELSE 2) = 1
  PROVE (IF TRUE THEN 1 ELSE 2) = 1
BY LevelComparison

THEOREM QuantifierSame ==
  ASSUME \A c : c = c PROVE \A c : c = c
BY LevelComparison

THEOREM BoundedSame ==
  ASSUME NEW S, \A c \in S : c = c PROVE \A c \in S : c = c
BY LevelComparison

\* A variable is not renamed; the same variable matches.
THEOREM VariableSame ==
  ASSUME x = x PROVE x = x
BY LevelComparison

THEOREM ChooseSame ==
  ASSUME (CHOOSE c \in {0} : TRUE) = (CHOOSE c \in {0} : TRUE)
  PROVE (CHOOSE c \in {0} : TRUE) = (CHOOSE c \in {0} : TRUE)
BY LevelComparison

THEOREM FunctionSame ==
  ASSUME NEW S, [c \in S |-> c] = [c \in S |-> c]
  PROVE [c \in S |-> c] = [c \in S |-> c]
BY LevelComparison

============================================================
