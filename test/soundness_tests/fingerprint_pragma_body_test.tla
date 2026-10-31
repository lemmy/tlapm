------------- MODULE fingerprint_pragma_body_test --------------

\* B is defined with a backend pragma.  The fingerprint must record the
\* body of such a definition, or the obligation ~B for B == FALSE, which
\* is true, and the one for the body below, which is false, have the
\* same fingerprint.  The first command proves the true version, the
\* second checks this module with the fingerprints of the first, and must
\* fail: ~TRUE is false.

B == TRUE (*{ by (prover:"smt3") }*)

THEOREM ~B
BY DEF B

=================================================================
command: d=${FILE%.tla}.tmp; rm -rf $d && mkdir $d && sed 's|^B == TRUE|B == FALSE|' ${FILE} > $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE} >/dev/null 2>&1 || exit 99; cp ${FILE} $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE}; r=$?; rm -rf $d; exit $r
result: 10
stderr: obligations? failed
