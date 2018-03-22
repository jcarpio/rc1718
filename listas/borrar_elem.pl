% borrar_elem(?E, ?Lista, ?ListaR).
% Es cierto cuando ListaR unifica con una
% lista que contiene los elementos de Lista
% pero con las ocurrencias de E eliminadas.

borrar_elem(_, [], []).
borrar_elem(E, [E|Resto], R):- 
  borrar_elem(E, Resto, R).
borrar_elem(E, [Cabeza|Resto], [Cabeza|R]):- 
   E \= Cabeza, borrar_elem(E, Resto, R).
