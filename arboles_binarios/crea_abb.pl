% crea_abb(+L, -A)
% Es cierto cuando A unifica con un arbol binario
% de búsqueda balanceado que contiene todas las
% etiquetas de L. Consideraremos que la lista está
% ordenada.
crea_abb([], nil).
crea_abb(L,a(Ca,A1,A2)):-
  length(L,N), N2 is N div 2,
  length(L1,N2),
  append(L1,[Ca|L2],L),
  crea_abb(L1,A1),
  crea_abb(L2,A2).

