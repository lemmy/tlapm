------------- MODULE fingerprint_pragma_body_test --------------

\* B is TRUE, so ~B is false.

B == TRUE (*{ by (prover:"smt3") }*)

THEOREM ~B
BY DEF B

=================================================================
command: d=${FILE%.tla}.tmp; rm -rf $d && mkdir $d && sed 's|^B == TRUE|B == FALSE|' ${FILE} > $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE} >/dev/null 2>&1 || exit 99; cp ${FILE} $d/${FILE} && ${TLAPM} --strict --cache-dir $d/cache $d/${FILE}; r=$?; rm -rf $d; exit $r
result: 10
stderr: obligations? failed
known: https://github.com/tlaplus/tlapm/issues/new
