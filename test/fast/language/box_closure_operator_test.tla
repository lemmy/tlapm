------------------- MODULE box_closure_operator_test -------------------

\* Operators whose bodies really are box-closed when the arguments are.
\* Coalescing turns the application into an opaque atom, so PTL can prove
\* the boxed goal only when the fact is boxed first.  A fix that refuses
\* every defined operator leaves these obligations unproved.

EXTENDS TLAPS

VARIABLES x, y

\* [](x = 0) is already boxed.
Fid(a) == a

THEOREM ASSUME Fid([](x = 0)) PROVE [](Fid([](x = 0)))
BY PTL

\* A conjunction of a formula with itself.
Fboth(a) == a /\ a

THEOREM ASSUME Fboth([](x = 0)) PROVE [](Fboth([](x = 0)))
BY PTL

\* Double negation does not change [](x = 0).
Fnn(a) == ~~a

THEOREM ASSUME Fnn([](x = 0)) PROVE [](Fnn([](x = 0)))
BY PTL

\* Both arguments are boxed, and so is their conjunction.
Fand(a, b) == a /\ b

THEOREM ASSUME Fand([](x = 0), [](y = 0))
         PROVE [](Fand([](x = 0), [](y = 0)))
BY PTL

\* Both arguments are boxed, and so is their disjunction.
For(a, b) == a \/ b

THEOREM ASSUME For([](x = 0), [](y = 0))
         PROVE [](For([](x = 0), [](y = 0)))
BY PTL

\* The second definition is the identity, so this is [](x = 0) again.
Fnest(a) == Fid(a)

THEOREM ASSUME Fnest([](x = 0)) PROVE [](Fnest([](x = 0)))
BY PTL

\* IF [](x = 0) THEN [](x = 0) ELSE TRUE is TRUE or [](x = 0).
Fif(a) == IF a THEN a ELSE TRUE

THEOREM ASSUME Fif([](x = 0)) PROVE [](Fif([](x = 0)))
BY PTL

\* b does not occur, so \A b : [](x = 0) is [](x = 0).
Fall(a) == \A b : a

THEOREM ASSUME Fall([](x = 0)) PROVE [](Fall([](x = 0)))
BY PTL

\* Builtin combinations the same closure rules accept.  Each operand of
\* /\ and \/ is a box, and ~<> (x = 0) is [](x # 0).
THEOREM ([](x = 0) /\ [](y = 0)) => []([](x = 0) /\ [](y = 0))
BY PTL

THEOREM ([](x = 0) \/ [](y = 0)) => []([](x = 0) \/ [](y = 0))
BY PTL

THEOREM (~<>(x = 0)) => [](~<>(x = 0))
BY PTL

=============================================================================
