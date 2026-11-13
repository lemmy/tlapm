------------- MODULE levelcomparison_rename_tuple_stest --------------

EXTENDS TLAPS

VARIABLE x

\* <<0>> = <<1>> does not yield <<2>> = <<1>>.
THEOREM Tuple ==
  ASSUME NEW c, NEW d, <<c>> = <<1>> PROVE <<d>> = <<1>>
BY LevelComparison

============================================================
known: https://github.com/tlaplus/tlapm/issues/new
