-------------- MODULE box_closure_operator_control_test --------------

\* These false theorems must stay unproved.  The arguments are state
\* formulas, the operator mentions a variable, or the body contains <>,
\* so the application is not box-closed.  x is 1 and then 0 forever;
\* where y is used, y is 0 forever and x is 1 and then 0.

EXTENDS TLAPS

VARIABLES x, y

Fneg(a) == ~a
Fstate(a) == a /\ (x = 1)
Fdiam(a) == <> (~a)

THEOREM ASSUME Fneg(x = 0) PROVE [](Fneg(x = 0))
BY PTL

THEOREM ASSUME Fstate([](y = 0)) PROVE [](Fstate([](y = 0)))
BY PTL

THEOREM ASSUME Fdiam([](x = 0)) PROVE [](Fdiam([](x = 0)))
BY PTL

=============================================================================
stderr: status:failed
stderr: prover:ls4
stderr: reason:false
nostderr: status:proved
nostderr: Unexpected error
nostderr: Unexpected exception
nostd*: ending abnormally
