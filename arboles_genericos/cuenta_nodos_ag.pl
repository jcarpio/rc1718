:- ensure_loaded('crea_arbolg.pl').

% cuenta_nodos_ag(+A, -N)
% Es cierto cuando N unifica con el número de nodos
% del árbol A
cuenta_nodos_ag(a(_, Lista_hijos), R):-
  cuenta_nodos_ag(Lista_hijos, RL),
  R is RL + 1.

cuenta_nodos_ag([], 0).
cuenta_nodos_ag([Ca|Resto], R):-
  cuenta_nodos_ag(Ca, RCa),  
  cuenta_nodos_ag(Resto, RResto),
  R is RCa + RResto.