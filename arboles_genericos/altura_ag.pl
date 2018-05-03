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

