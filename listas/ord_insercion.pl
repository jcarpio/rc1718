%--------------------------------------------------
% ordena_insercion(+Lista, -ListaR).
%    es cierto cuando ListaR unifica con una lista
%    que contiene los mismos elementos que Lista
%    ordenados de menor a mayor.
%--------------------------------------------------

ordena_insercion([], []).
ordena_insercion([Cabeza|Resto], R2):-
  ordena_insercion(Resto, R), 
  inserta_en_list_ord(Cabeza, R, R2).

%--------------------------------------------------
% inserta_en_list_ord(+Elem, +Lista, -ListaR).
%    es cierto cuando ListaR unifica con una lista
%    que contiene los elementos de la lista
%    ordenada Lista, con el elemento Elem insertado
%    de forma ordenada.
%--------------------------------------------------

inserta_en_list_ord(E, [], [E]).
inserta_en_list_ord(E, [Cabeza|Resto], 
   [E,Cabeza|Resto]):- E =< Cabeza.
inserta_en_list_ord(E, [Cabeza|Resto], [Cabeza|R]):-
   E > Cabeza, inserta_en_list_ord(E, Resto, R).

