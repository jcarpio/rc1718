:- ensure_loaded('crea_arbolg.pl').

% suma_nodos_ag(+A, -R)
% Es cierto cuando R unifica con la suma
% de todas las etiquetas del árbol A

suma_nodos_ag(a(E, Lista_hijos), R2):-
  suma_nodos_ag(Lista_hijos, R),
  R2 is R + E.

suma_nodos_ag([], 0).
suma_nodos_ag([Ca|Resto], R):-
  suma_nodos_ag(Ca, RCa),
  suma_nodos_ag(Resto, RResto),
  R is RCa + RResto.