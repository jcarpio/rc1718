%--------------------------------------------------
% concatena(+List1, +List2, -ListR).
%
%   es cierto cuando ListaR unifica con una 
%   lista que contiene los elementos de la 
%   lista List1 en el mismo orden y seguidos
%   de los elementos de la lista List2 en el
%   mismo orden.
%--------------------------------------------------

concatena([], L2, L2).
concatena([Cabeza|Resto], L2, [Cabeza|R]):-
  concatena(Resto, L2, R).