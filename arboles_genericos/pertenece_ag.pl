:- ensure_loaded('crea_arbolg.pl').

% pertenece_ag(+E, +A)
% Es cierto si el elemento E pertenece al
% árbol A

pertenece_ag(E, a(E, _)).

pertenece_ag(E, a(_, Lista_hijos)):-
  pertenece_ag(E, Lista_hijos).

pertenece_ag(E, [Ca|_]) :- pertenece_ag(E, Ca).
pertenece_ag(E, [_|Resto]):- pertenece_ag(E, Resto).