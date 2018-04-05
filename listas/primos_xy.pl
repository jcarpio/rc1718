%------------------------------------------------
% lista_divisores(+X, +Y, -ListaR).
%   es cierto cuando ListaR unifica con una lista
%   que contiene a los n�meros cuyo resto
%   de la divisi�n entera de X entre Z es igual a 0
%   para valores de Z entre 1 e Y.
%------------------------------------------------

lista_divisores(_, 1, [1]). 
lista_divisores(X, Y, [Y|R]):-
   Y > 1,
   Y2 is Y - 1,  
   0 is X mod Y,
   lista_divisores(X, Y2, R).
   
lista_divisores(X, Y, R):-
   Y > 1,
   Y2 is Y - 1, 
   Resto is X mod Y, Resto \= 0,
   lista_divisores(X, Y2, R).

%---------------------------------------------------
% primo(+X)
% es cierto si X unifica con un n�mero primo.
%---------------------------------------------------

primo(X):- lista_divisores(X, X, [X,1]).

%---------------------------------------------------
% primosEntreXY(+X, +Y, -ListaR)
%   es cierto cuando ListaR unifica con una lista
%   que contiene a los primos que van desde X hasta
%   Y ambos incluidos en orden ascendente.
%---------------------------------------------------

primosEntreXY(X, Y, []) :- X > Y.
primosEntreXY(X, Y, [X|R]):-
  X =< Y,
  X2 is X + 1,   primo(X),
  primosEntreXY(X2, Y, R).

   
primosEntreXY(X, Y, R):-
  X =< Y,
  X2 is X + 1, \+ primo(X),
  primosEntreXY(X2, Y, R).
  
   

   