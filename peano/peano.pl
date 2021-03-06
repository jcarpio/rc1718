% p2d(+P, -D)
% Es cierto cuando D unifica con
% el decimal equivalente
% al numero en aritmética de Peano P
p2d(0, 0).
p2d(s(P), D2):- p2d(P, D),
   D2 is D + 1.
   
% d2p(+Dec, ?Peano)
% Es cierto cuando Peano unifica
% con el número natural 
% equivalente a al decimal Dec
% ejemplo:
% dec2peano(3, P)
% P = s(s(s(0)))

d2p(0, 0).
d2p(N, s(R)):- N > 0,
  N2 is N-1, d2p(N2, R).
  
% d2p(3, R) -> R = s(s(s(0)))
% d2p(2, R) -> R = s(s(0))

% suma(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con la suma
% de X en Y en aritmética de Peano
suma(0, Y, Y).
suma(s(X), Y, s(Z)):- suma(X, Y, Z).

% resta(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con la resta de 
% X menos Y en aritmética de Peano
resta(X,Y,Z) :- suma(Y,Z,X).

% producto(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con
% el producto de X por Y 

producto(_, 0, 0).
producto(X, s(Y), Z2):-
   producto(X, Y, Z), suma(Z, X, Z2).

% 4 * 3 = 4 + 4 + 4
% 4 * 2 = 4 + 4

% P(no)
% P(n-1) -> P(n)

% ejemplo de ejecucion:
% d2p(12,Z), producto(X,Y, Z), p2d(X, X2), p2d(Y, Y2).

%menor(?X, ?Y)
% Es cierto cuando X es menor que Y en
% aritmética de Peano.
menor(0, s(_)).
menor(s(X), s(Y)):- menor(X, Y).

%mayor(?X, ?Y)
% Es cierto si X es mayor que Y
mayor(s(_), 0).
mayor(s(X), s(Y)):- mayor(X, Y).
 
% mayor_o_igual(X, Y)
% Es cierto si X es mayor o igual que Y
mayor_o_igual(X, X).
mayor_o_igual(X, Y):- mayor(X, Y). 

% divide(?X, ?Y, ?Z, ?Resto)
% Es cierto si Z unifica con la división entera
% de X entre Y y Resto unifica con el resto en
% aritmética de Peano. 
% X será mayor que Y.

% 1) P(no)
% 2) P(n-1) -> P(n)

divide(X, Y, 0, X):- menor(X, Y).
divide(X, Y, s(Z), R):- mayor_o_igual(X,Y), 
   resta(X, Y, X2), divide(X2, Y, Z, R).










