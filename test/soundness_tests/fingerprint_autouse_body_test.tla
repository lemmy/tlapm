------------- MODULE fingerprint_autouse_body_test --------------

\* A is hidden, but ExpandENABLED with AutoUSE expands it, so the
\* obligation depends on the body of A.  The fingerprint of a hidden
\* definition must therefore record its body, or the obligation for
\* A == x' = 1, which is true, and the one for the body below, which is
\* false, have the same fingerprint.  The first command proves the
\* true version, the second checks this module with the fingerprints of
\* the first, and must fail: x' = 1 /\ x' = 2 is not enabled.

EXTENDS TLAPS

VARIABLE x

A == x' = 1 /\ x' = 2

THEOREM ENABLED A
BY ExpandENABLED, AutoUSE

=================================================================
command: d=${FILE%.tla}.tmp; rm -rf $d && mkdir $d && sed 's| /\\ x. = 2||' ${FILE} > $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE} >/dev/null 2>&1 || exit 99; cp ${FILE} $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE}; r=$?; rm -rf $d; exit $r
result: 10
stderr: obligations? failed
