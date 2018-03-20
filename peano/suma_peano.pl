% suma(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con la suma
% de X en Y en aritm�tica de Peano
suma(0, Y, Y).
suma(s(X), Y, s(Z)):- suma(X, Y, Z).

% resta(?X, ?Y, ?Z)
% Es cierto cuando Z unifica con la resta de 
% X menos Y en aritm�tica de Peano
resta(X,Y,Z) :- suma(Y,Z,X).