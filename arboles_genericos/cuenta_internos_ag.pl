% cuenta_internos_ag(+A, -N)
% Es cierto cuando N unifica con el n�mero de nodos
% internos del �rbol gen�rico A

:- ensure_loaded('cuenta_nodos_ag.pl').
:- ensure_loaded('cuenta_hojas_ag.pl').

cuenta_internos_ag(A, R):-
  cuenta_nodos_ag(A, NN),
  cuenta_hojas_ag(A, NH),
  R is NN - NH.
