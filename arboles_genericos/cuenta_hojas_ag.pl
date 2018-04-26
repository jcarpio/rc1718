:- ensure_loaded('crea_arbolg.pl').
:- ensure_loaded('ejemplos_ag.pl').

% cuenta_hojas_ag(+A, -N)
% Es cierto cuando N unifica con el número de hojas
% del árbol genérico A

cuenta_hojas_ag(a(_,Lista_hijos), R):-
	Lista_hijos \= [],
	cuenta_hojas_ag(Lista_hijos, R).

cuenta_hojas_ag(a(_,[]), 1).

cuenta_hojas_ag([],0).

cuenta_hojas_ag([Cab|Resto], R):-
	cuenta_hojas_ag(Cab, RCab),
	cuenta_hojas_ag(Resto, RResto),
	R is RCab + RResto.