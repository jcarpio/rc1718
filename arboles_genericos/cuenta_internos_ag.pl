% cuenta_internos_ag(+A, -N)
% Es cierto cuando N unifica con el n�mero de nodos
% internos del �rbol gen�rico A

:- include('cuenta_nodos_ag.pl').
:- include('cuenta_hojas_ag.pl').

cuenta_internos_ag(A, R):-
  cuenta_nodos_ag(A, NN),
  cuenta_hojas_ag(A, NH),
  R is NN - NH.
