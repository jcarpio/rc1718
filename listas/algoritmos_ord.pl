%--------------------------------------------------
% divide(+Elem, +Lista, -Menores, -Mayores)
%
%   es cierto cuando Menores unifica con una lista
%   que contiene los elemenentos de Lista que son
%   menores o iguales que Elem y Mayores unifica
%   con una lista que contiene los elementos de
%   Lista que son mayores que Elem.
%--------------------------------------------------
divide(_, [], [], []).
divide(E, [Cabeza|Resto], [Cabeza|Men], May):-
   Cabeza =< E, divide(E, Resto, Men, May).   
divide(E, [Cabeza|Resto], Men, [Cabeza|May]):-
   Cabeza > E, divide(E, Resto, Men, May).

%---------------------------------------------------
% ordena_quick(+Lista, -ListaR).
%    es cierto cuando ListaR unifica con una lista que
%    contiene los mismos elementos que Lista ordenados
%    de menor a mayor.
%-----------------------------------------------
ordena_quick([], []).
ordena_quick([E|Resto], R):-
   divide(E, Resto, Men, May),
   ordena_quick(Men, RMen),
   ordena_quick(May, RMay),
   append(RMen, [E|RMay], R).

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

%--- Ejemplos--------------------------------------
lista1([1,7,4,5,9,0,4,2,6,7,3,1]).
lista2([9,4,2,8,1,7,4,3]).
lista3([1,7,4,5,9,0,4,2,6,7,3,1,1,9,6,4,3,1]).
  
