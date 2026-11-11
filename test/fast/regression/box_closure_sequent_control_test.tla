-------------- MODULE box_closure_sequent_control_test --------------

\* A state formula is not box-closed, nor is a sequent whose conclusion
\* is a state formula or a diamond.  x is 0 and then 1; where y is used,
\* y is 0 and then 1 while x stays 0.

EXTENDS TLAPS

VARIABLES x, y

THEOREM ASSUME x = 0 PROVE [](x = 0)
BY PTL

THEOREM ASSUME ASSUME x = 0 PROVE y = 0
         PROVE [](x = 0 => y = 0)
BY PTL

THEOREM ASSUME ASSUME x = 0 PROVE <>(y = 0)
         PROVE [](x = 0 => <>(y = 0))
BY PTL

=============================================================================
stderr: status:failed
stderr: prover:ls4
stderr: reason:false
nostderr: status:proved
nostderr: Unexpected error
nostderr: Unexpected exception
nostd*: ending abnormally
