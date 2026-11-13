------------- MODULE levelcomparison_control_test -------------

\* False theorems that LevelComparison must keep rejecting.  A rename
\* may not increase the level, may not send one parameter to two
\* names, and may not rename a variable or a definition.  Quantifier
\* kind and domain are part of the comparison.  CHOOSE, set
\* constructors, and functions use the bound of each side.  CASE
\* compares its first arm and its OTHER arm.  IF and /\ compare every
\* subformula.

EXTENDS TLAPS

VARIABLES x, y

Foo == 1
Bar == x
Baz == 2

\* c cannot be sent to both d and e.
THEOREM Inconsistent ==
  ASSUME NEW c, NEW d, NEW e, <<c, c>> = <<1, 1>>
  PROVE <<d, e>> = <<1, 1>>
BY LevelComparison

\* x = 1 does not yield y = 1.
THEOREM Variable ==
  ASSUME x = 1 PROVE y = 1
BY LevelComparison

\* A constant parameter is not a state expression.
THEOREM ConstantToState ==
  ASSUME NEW CONSTANT c, NEW STATE s, c = 1 PROVE s = 1
BY LevelComparison

\* A constant parameter is not the variable x.
THEOREM ConstantToVariable ==
  ASSUME NEW CONSTANT c, c = 1 PROVE x = 1
BY LevelComparison

\* Bar is x, which has level 1.
THEOREM ConstantToStateDef ==
  ASSUME NEW CONSTANT c, c = 1 PROVE Bar = 1
BY LevelComparison

\* A state parameter is not an action.
THEOREM StateToAction ==
  ASSUME NEW STATE s, NEW ACTION A, s = 1 PROVE A = 1
BY LevelComparison

\* Foo is 1 and Baz is 2.  Definitions are not renamed.
THEOREM DefinitionName ==
  ASSUME Foo = 1 PROVE Baz = 1
BY LevelComparison

\* \A z \in {0} : z = z does not yield c = 0.
THEOREM QuantifierKind ==
  ASSUME NEW c, \A z \in {0} : z = z
  PROVE \E d \in {0} : c = d
BY LevelComparison

\* Every element of {0} is 0.  The element of {1} is not.
THEOREM Domain ==
  ASSUME \A z \in {0} : z = 0
  PROVE \A d \in {1} : d = 0
BY LevelComparison

\* b is c, and c is 0, so b = 0.  f \in {k} and f = 0 require k = 0.
THEOREM NestedDomain ==
  ASSUME NEW k,
         \A a \in {0} : \A b \in {a} : b = 0
  PROVE \A e \in {0} : \A f \in {k} : f = 0
BY LevelComparison

\* The left value is 0.  The right value is 0 only if c = 0.
THEOREM Choose ==
  ASSUME NEW c,
         (CHOOSE z \in {0} : TRUE) = 0
  PROVE (CHOOSE d \in {0} : d = c) = 0
BY LevelComparison

\* The left set is S.  The right set is the elements of S equal to c.
THEOREM SetConstructor ==
  ASSUME NEW S, NEW c,
         {z \in S : z = z} = S
  PROVE {d \in S : d = c} = S
BY LevelComparison

\* The right function is constantly c, not the identity.
THEOREM FunctionConstructor ==
  ASSUME NEW S, NEW c,
         [z \in S |-> z] = [z \in S |-> z]
  PROVE [z \in S |-> z] = [d \in S |-> c]
BY LevelComparison

\* The right side has one element <<c>> when S is nonempty, not every
\* <<z>> for z \in S.
THEOREM SetOf ==
  ASSUME NEW S, NEW c,
         {<<z>> : z \in S} = {<<z>> : z \in S}
  PROVE {<<z>> : z \in S} = {<<c>> : z \in S}
BY LevelComparison

\* The two records do not have the same fields.
THEOREM RecordFields ==
  ASSUME [a |-> 1] = [a |-> 1]
  PROVE [a |-> 1, b |-> 2] = [a |-> 1]
BY LevelComparison

\* Field a is not field b.
THEOREM ExceptField ==
  ASSUME NEW r,
         [r EXCEPT !.a = 1] = [r EXCEPT !.a = 1]
  PROVE [r EXCEPT !.b = 1] = [r EXCEPT !.a = 1]
BY LevelComparison

\* The first arms differ: 1 and 2.
THEOREM CaseFirstArm ==
  ASSUME (CASE TRUE -> 1 [] FALSE -> 9) = 1
  PROVE (CASE TRUE -> 2 [] FALSE -> 9) = 1
BY LevelComparison

\* OTHER is 2 on the left and 3 on the right.
THEOREM CaseOther ==
  ASSUME (CASE FALSE -> 1 [] OTHER -> 2) = 2
  PROVE (CASE FALSE -> 1 [] OTHER -> 3) = 2
BY LevelComparison

\* The ELSE branches differ.
THEOREM IfBranch ==
  ASSUME (IF FALSE THEN 1 ELSE 2) = 2
  PROVE (IF FALSE THEN 1 ELSE 3) = 2
BY LevelComparison

\* The second conjuncts differ.
THEOREM Conjunction ==
  ASSUME (1 = 1) /\ (2 = 2) PROVE (1 = 1) /\ (2 = 3)
BY LevelComparison

============================================================
stderr: status:failed
stderr: prover:levelcomparison
nostderr: status:proved
nostderr: Unexpected error
nostderr: Unexpected exception
nostd*: ending abnormally
