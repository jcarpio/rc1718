% reverse(?Lista, ?ListR).
% Es cierto cuando ListR unifica con una lista
% que contiene los mismos elementos de Lista
% en orden inverso.
reverse([], []).
reverse([Cabeza|Resto], R2):- reverse(Resto, R),
   insertar_final(Cabeza, R, R2). 

% insertar_final(+E, +Lista, -R)
% Es cierto cuando R unifica con una lista
% que contiene los elementos de Lista con
% el elemento E insertado al final.
insertar_final(E, [], [E]).
insertar_final(E, [Cabeza|Resto], [Cabeza|R]):- 
   insertar_final(E, Resto, R).