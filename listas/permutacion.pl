% permutacion(?L1, ?L2).
% Es cierto cuando L1 unifica con una lista
% que contiene los elementos de L2 en orden
% distinto. Por unificaci�n debo poder obtener
% todas las posibles ordenaciones.

permutacion([], []).
permutacion(R2, [Cabeza|Resto]) :-
  permutacion(R ,Resto), insertar(Cabeza, R, R2).

% insertar(E, Lista, R).
% Es cierto cuando R unifica con una lista 
% que contiene los elementos de Lista con 
% E insertado en cualquier posici�n. Por
% unificaci�n debe dar todas las opciones.

insertar(E, Lista, [E|Lista]).
insertar(E, [Cabeza|Resto], [Cabeza|R]):-
  insertar(E, Resto, R).

% ver https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_7.html