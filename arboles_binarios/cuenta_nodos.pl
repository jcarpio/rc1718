
% cuenta_nodos(+A, -N)
% es cierto cuando N unifica con el número
% de nodos del árbol A

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, HI, HD), R):-
  cuenta_nodos(HI, RI),
  cuenta_nodos(HD, RD),
  R is RI + RD + 1.  


arbol( 
       a(a, a(b,a(c,nil,nil),nil), a(d,nil,nil))
     ).


 