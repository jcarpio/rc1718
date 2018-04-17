
% cuenta_nodos(+A, -N)
% es cierto cuando N unifica con el número
% de nodos del árbol A

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, HI, HD), R):-
  cuenta_nodos(HI, RI),
  cuenta_nodos(HD, RD),
  R is RI + RD + 1. 

% lista_hojas(+A, -L)
% es cierto cuando L unifica con una lista
% que contiene las etiquetas de las hojas de
% árbol A

lista_hojas(nil, []).

lista_hojas(a(E,nil,nil), [E]).

lista_hojas(a(_, nil, HD), RD):-
  HD \= nil, 
  lista_hojas(HD, RD).

lista_hojas(a(_, HI, nil), RI):-
  HI \= nil, 
  lista_hojas(HI, RI).
lista_hojas(a(_, HI, HD), R):-
  HI \= nil, HD \= nil,
  lista_hojas(HI, RI),
  lista_hojas(HD, RD),
  append(RI, RD, R).

arbol1( 
       a(a, a(b,a(c,nil,nil),nil), a(d,nil,nil))
     ).

% cuenta_hojas(+A, -R)
% Es cierto cuando R unifica con el número de 
% hojas del árbol A

cuenta_hojas(A, R2):-
  lista_hojas(A, R),
  length(R, R2).

% cuenta_internos(+A, -R).
% Es cierto cuando R unifica con el número
% de nodos internos del árbol A (todos los nodos 
% menos las hojas)

cuenta_internos(A, R):-
  cuenta_nodos(A, NumNodos),
  cuenta_hojas(A, NumHojas),
  R is NumNodos - NumHojas.
