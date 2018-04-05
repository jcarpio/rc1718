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
  
