
% suma_nodos(+A, -R)
% Es cierto cuando R unifica con la suma de
% todos las etiquetas de árbol A.

suma_nodos(nil, 0).
suma_nodos(a(E, HI, HD), R):-
 suma_nodos(HI, RI),
 suma_nodos(HD, RD),
 R is E + RI + RD.	

arbol2( 
       a(1, a(2,a(3,nil,nil),nil), a(4,nil,nil))
     ). 