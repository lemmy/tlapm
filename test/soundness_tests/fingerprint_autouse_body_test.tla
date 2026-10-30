------------- MODULE fingerprint_autouse_body_test --------------

\* A is x' = 1 /\ x' = 2, which is not enabled.  ENABLED A is false.

EXTENDS TLAPS

VARIABLE x

A == x' = 1 /\ x' = 2

THEOREM ENABLED A
BY ExpandENABLED, AutoUSE

=================================================================
command: d=${FILE%.tla}.tmp; rm -rf $d && mkdir $d && sed 's| /\\ x. = 2||' ${FILE} > $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE} >/dev/null 2>&1 || exit 99; cp ${FILE} $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE}; r=$?; rm -rf $d; exit $r
result: 10
stderr: obligations? failed
known: https://github.com/tlaplus/tlapm/issues/new
