% crea_arbol(+L, -A)
% Es cierto cuando A es un árbol binario que
% contiene todas las etiqiuetas de la lista L

crea_arbol([], nil).

crea_arbol([Cab|L], a(Cab, R1, R2)):-
  length(L, N),
  N2 is N div 2,
  length(L1, N2),
  append(L1, L2, L),
  crea_arbol(L1, R1),
  crea_arbol(L2, R2).