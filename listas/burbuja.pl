%--------------------------------------------------
% ordena_burbuja(+Lista, -ListaR).
%   es cierto cuando ListaR unifica con una
%   lista que contiene los mismos elementos que
%   Lista ordenados de menor a mayor.
%--------------------------------------------------
ordena_burbuja(Lista, Lista):- ordenada(Lista).
ordena_burbuja(Lista, R2):-
  append(L1, [E1, E2|Resto], Lista), E1 > E2,
  append(L1, [E2, E1| Resto], R),
  ordena_burbuja(R, R2).


%--------------------------------------------------
% ordenada(+Lista)
%    es cierto cuando Lista unifica con una lista
%    que contiene sus elementos ordenados de menor
%    a mayor.
%--------------------------------------------------
ordenada([]).
ordenada([_]).
ordenada([Cabeza1, Cabeza2|Resto]):- 
   Cabeza1 =< Cabeza2, ordenada([Cabeza2|Resto]).
