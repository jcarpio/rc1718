% altura_ag(+A, -R)
% Es cierto cuando R unifica con la altura
% del árbol genérico A

altura_ag(a(_, Lista_hijos), R):-
   altura_ag(Lista_hijos, RL),
   R is RL + 1. 

altura_ag([], 0).
altura_ag([Ca|Resto], R):-
  altura_ag(Resto, RResto),
  altura_ag(Ca, RCa),
  R is max(RCa, RResto).

arbol1(
     a(1, [a(2,[a(3,[a(4,[])])])])
     ).

arbol2(
     a(1, [a(2,[a(3,[a(4,[])])]), 
           a(5,[a(6,[a(7,[a(8,[a(9,[])])])])])
          ])
     ).