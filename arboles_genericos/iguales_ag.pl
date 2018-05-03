:- ensure_loaded('crea_arbolg.pl').
:- ensure_loaded('ejemplos_ag.pl').

% iguales_ag(+A, +B)
% Es cierto si A y B son dos �rboles iguales
iguales(A,A).

% simetricos_ag(+A, +B)
% Es cierto si A y B son dos �rboles sim�tricos
simetricos_ag(A,B):- invertir_ag(A,B).

% simetrico_ag(+A)
% Es cierto si A es un �rbol sim�trico respecto a
% un eje central
simetrico_ag(A):- invertir_ag(A, A).
 
% invertir_ag(+A, -R)
% Es cierto cuando R unifica con el �rbol A invertido

invertir_ag(a(E, Lista_hijos), a(E, R)):-
  invertir_ag(Lista_hijos, R).

invertir_ag([], []). 
invertir_ag([Ca|Resto], R):-
  invertir_ag(Ca, RCa),
  invertir_ag(Resto, RResto),
  append(RResto, [RCa], R).

% isomorfos_ag(+A, +B)
% Es cierto si A y B son isomorfos

isomorfos_ag(a(_, Lista_hijos), a(_, Lista_hijos2)):-
  isomorfos_ag(Lista_hijos, Lista_hijos2).

isomorfos_ag([], []).
isomorfos_ag([Ca|Resto],  [Ca2|Resto2]):-
  isomorfos_ag(Ca, Ca2),
  isomorfos_ag(Resto, Resto2).

