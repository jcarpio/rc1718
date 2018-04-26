:- ensure_loaded('crea_arbolg.pl').

% cuenta_nodos(+A, -N)
% Es cierto cuando N unifica con el número de nodos
% del árbol A
cuenta_nodos(a(_, Lista_hijos), R):-
  cuenta_nodos(Lista_hijos, RL),
  R is RL + 1.

cuenta_nodos([], 0).
cuenta_nodos([Ca|Resto], R):-
  cuenta_nodos(Ca, RCa),  
  cuenta_nodos(Resto, RResto),
  R is RCa + RResto.